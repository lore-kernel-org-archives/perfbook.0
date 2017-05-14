Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uYc8D5KlHrUnAtjVbFUW7OxwaVoAJvZ6xlZ9yJfW/UU=;
 b=YnokY3rNXoW/SAiOJ/daHY1t1UiVArnChfKrHFBLaOpvdJCeqOgAv2fHosO3sjYUqz
 VYEffDviVgl4Z7/Zsq8f6Gz8QkE3vy1hKqvvIPD2vrud0jq22qNSN4zvI7zWMY0vMccG
 xR50mVI36eF47HXD7Hlg84WOn4+e55iof3K9tCquVmjMErIPqkbqd0kALv7scBD6isFr
 fSYYPDpHnbALo855Tcc53OG8TFfrRNTVzPvaTs4uTnYe6cj8Hk+Dq0L37b6duD2N0oob
 UB5Po+NjWZlOMRI7Hr9dRaAhXpjJbGfLDmRuoDVDhJEJKpk+4+tCXN9o5GTrjAB855a8
 gayg==
Subject: Re: [PATCH 1/2] count_stat_eventual: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
 <1494515022-30278-2-git-send-email-junchangwang@gmail.com>
 <61acaa88-abd6-58f5-4d1f-80a2ef58d53e@gmail.com>
 <20170513124556.GJ3956@linux.vnet.ibm.com>
 <831607d1-8169-ee2c-1d48-c70381481cda@gmail.com>
 <20170513225637.GL3956@linux.vnet.ibm.com>
 <45998636-1d97-3c44-1e89-543366637317@gmail.com>
 <223e58f6-0689-8357-e25d-a69dfb459d1a@gmail.com>
 <20170514042023.GN3956@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <356a1ef2-6ba6-aff4-e721-084a5a87316d@gmail.com>
Date: Mon, 15 May 2017 00:15:34 +0900
MIME-Version: 1.0
In-Reply-To: <20170514042023.GN3956@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/05/13 21:20:23 -0700, Paul E. McKenney wrote:
> On Sun, May 14, 2017 at 10:31:51AM +0900, Akira Yokosawa wrote:
>> On 2017/05/14 9:58, Akira Yokosawa wrote:
>>> On 2017/05/14 7:56, Paul E. McKenney wrote:
>>>> On Sat, May 13, 2017 at 11:37:06PM +0900, Akira Yokosawa wrote:
>>>>> On 2017/05/13 05:45:56 -0700, Paul E. McKenney wrote:
>>>>>> On Sat, May 13, 2017 at 09:04:38PM +0900, Akira Yokosawa wrote:
>>>>>>> Hi Jason & Paul,
>>>>>>>
>>>>>>> although this has already been applied, I have a comment.
>>>>>>>
>>>>>>> On 2017/05/11 23:03:41 +0800, Junchang Wang wrote:
>>>>>>>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>>>>>>>> ---
>>>>>>>>  CodeSamples/count/count_stat_eventual.c | 8 ++++----
>>>>>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
>>>>>>>> index 059ab8b..cbde4aa 100644
>>>>>>>> --- a/CodeSamples/count/count_stat_eventual.c
>>>>>>>> +++ b/CodeSamples/count/count_stat_eventual.c
>>>>>>>> @@ -27,12 +27,12 @@ int stopflag;
>>>>>>>>  
>>>>>>>>  void inc_count(void)
>>>>>>>>  {
>>>>>>>> -	ACCESS_ONCE(__get_thread_var(counter))++;
>>>>>>>> +	READ_ONCE(__get_thread_var(counter))++;
>>>>>>>
>>>>>>> This is OK because READ_ONCE() is defined as the same as ACCESS_ONCE()
>>>>>>> in CodeSamples. However, the definition in the current Linux kernel
>>>>>>> would not permit this.
>>>>>>>
>>>>>>> A read-modify-write access would need both READ_ONCE() and WRITE_ONCE().
>>>>>>> However, since "counter" is thread local and updated only by its owner,
>>>>>>> we don't need READ_ONCE() here. So:
>>>>>>>
>>>>>>> +	WRITE_ONCE(__get_thread_var(counter), __get_thread_var(counter) + 1);
>>>>>>>
>>>>>>> should have been sufficient.

So, I measured the performance after this change.
Unfortunately, this change doubles the overhead of updater.

By inspecting the generated code, it looks like GCC (v5.4 for x86_64 with -O3 option)
can't figure out two "__get_thread_var(counter)"s are identical, and uses two
registers as pointers to access it. __get_thread_var() seems complex enough
to obfuscate the compiler.

To avoid this performance regression, we can use a temporary pointer as a hint for
optimization:

	void inc_count(void)
	{
		unsigned long *p_cnt = &__get_thread_var(counter);

		WRITE_ONCE(*p_cnt, *p_cnt + 1);
	}

Another idea is to restore ACCESS_ONCE().
As long as the argument is properly aligned scalar type, ACCESS_ONCE() should be OK.

	ACCESS_ONCE(__get_thread_var(counter))++;

will emit both load and store instructions, but in this short function,
the compiler has no way to optimize away either access even if we don't use
ACCESS_ONCE().

Thoughts?

                      Thanks, Akira

>>>>>>>
>>>>>>> Problem with this change is that the line gets too wide when applied to
>>>>>>> the code snippet in 2-column layout.
>>>>>>
>>>>>> Good point -- though renumbering the code is not all -that- hard.
>>>>>>
>>>>>> I clearly should have made a better READ_ONCE() that enforced the same
>>>>>> constraints as does the Linux kernel, perhaps something like this:
>>>>>>
>>>>>> 	#define READ_ONCE(x) ({ ACCESS_ONCE(x) })
>>>>>>
>>>>>> Thoughts?
>>>>>
>>>>> I assume you meant:
>>>>>
>>>>> 	#define READ_ONCE(x) ({ ACCESS_ONCE(x); })
>>>>
>>>> Indeed!  Good catch!!!
>>>>
>>>>> I'm afraid this still permits uses such as:
>>>>>
>>>>> 	READ_ONCE(y)++;
>>>>>
>>>>> Looks like we need a complex definition which resembles that of
>>>>> include/linux/compiler.h.  Hmm???
>>>>
>>>> OK, how about this?
>>>>
>>>> #define READ_ONCE(x) ({ typeof(x) ___x = ACCESS_ONCE(x); ___x; })
>>>
>>> Ah, this resulted in an error as expected!
>>>
>>> 	main.c: In function ‘inc_test’:
>>> 	main.c:11:18: error: lvalue required as increment operand
>>> 	     READ_ONCE(*p)++;
>>>
>>
>> But the definition above will conflict with the argument "___x":
>>
>> 	y = READ_ONCE(___x);
>>
>> This won't work as expected.
>> For CodeSamples, I guess we can safely reserve the name "___x".
>>
>> Thoughts?
> 
> It is already reserved.  User programs are not supposed to start
> variables with "__".  Which means that the "___x" name is of dubious
> legality as far as the C standard is concerned, but so it goes.
> If the compiler starts complaining about it, it can be changed.  ;-)
> 
> 							Thanx, Paul
> 
>>                    Thanks, Akira
>>
>>> Glad to know we can avoid the complexity of the kernel.
>>>
>>>                         Thanks, Akira
>>>
>>>>
>>>>> And I have another pending question regarding 2/2 of this patch set.
>>>>> That might result in other addition of line to the code. I think
>>>>> I can send it tomorrow.
>>>>
>>>> Looking forward to seeing it!  ;-)
>>>>
>>>> 							Thanx, Paul
>>>>
>>>>>>> Hmm...
>>>>>>>
>>>>>>>                                  Thanks, Akira
>>>>>>>
>>>>>>>>  }
>>>>>>>>  
>>>>>>>>  unsigned long read_count(void)
>>>>>>>>  {
>>>>>>>> -	return ACCESS_ONCE(global_count);
>>>>>>>> +	return READ_ONCE(global_count);
>>>>>>>>  }
>>>>>>>>  
>>>>>>>>  void *eventual(void *arg)
>>>>>>>> @@ -43,8 +43,8 @@ void *eventual(void *arg)
>>>>>>>>  	while (stopflag < 3) {
>>>>>>>>  		sum = 0;
>>>>>>>>  		for_each_thread(t)
>>>>>>>> -			sum += ACCESS_ONCE(per_thread(counter, t));
>>>>>>>> -		ACCESS_ONCE(global_count) = sum;
>>>>>>>> +			sum += READ_ONCE(per_thread(counter, t));
>>>>>>>> +		WRITE_ONCE(global_count, sum);
>>>>>>>>  		poll(NULL, 0, 1);
>>>>>>>>  		if (stopflag) {
>>>>>>>>  			smp_mb();
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>
>>>> .
>>>>
>>>
>>>
>>
> 
> 

