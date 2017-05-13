Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NeKa6ieZjZ7dLZvXPIqre/1L/nyL1EkCGuvzH/KKHLs=;
 b=U/qiQFWyCS9n82Qweze/8GR5XTU14re8zgVoJ0ob+da1KP0rBZ2Zm/WCcZdV9QNHbi
 zvNvr/8whSvv6TCae1BVYRR0B3y8FxossvV2iG0fn39UaSYjdaKyQJpyMbX+HcLr7mrU
 8SPq3edRlS24B7no9tdXeHfOJvjgoBo5oxAi2v9EnCmCDH+9Zood+Ww1T3xbg02Mq5h0
 9YHoMi5ls8E2SVh0o8Eev9qQWk3klRoz7ywKcYq/BKeVRHUJlCgh9FWcYMELfp6i+YSj
 pyadSGfduvLiQ15ekIQyJL2qjhyEEdhWH3XDTX+Rh+A4RRX7QXZPMkWn5l4Xcd+mn4vM
 nb+w==
Subject: Re: [PATCH 1/2] count_stat_eventual: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
 <1494515022-30278-2-git-send-email-junchangwang@gmail.com>
 <61acaa88-abd6-58f5-4d1f-80a2ef58d53e@gmail.com>
 <20170513124556.GJ3956@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <831607d1-8169-ee2c-1d48-c70381481cda@gmail.com>
Date: Sat, 13 May 2017 23:37:06 +0900
MIME-Version: 1.0
In-Reply-To: <20170513124556.GJ3956@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/05/13 05:45:56 -0700, Paul E. McKenney wrote:
> On Sat, May 13, 2017 at 09:04:38PM +0900, Akira Yokosawa wrote:
>> Hi Jason & Paul,
>>
>> although this has already been applied, I have a comment.
>>
>> On 2017/05/11 23:03:41 +0800, Junchang Wang wrote:
>>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>>> ---
>>>  CodeSamples/count/count_stat_eventual.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
>>> index 059ab8b..cbde4aa 100644
>>> --- a/CodeSamples/count/count_stat_eventual.c
>>> +++ b/CodeSamples/count/count_stat_eventual.c
>>> @@ -27,12 +27,12 @@ int stopflag;
>>>  
>>>  void inc_count(void)
>>>  {
>>> -	ACCESS_ONCE(__get_thread_var(counter))++;
>>> +	READ_ONCE(__get_thread_var(counter))++;
>>
>> This is OK because READ_ONCE() is defined as the same as ACCESS_ONCE()
>> in CodeSamples. However, the definition in the current Linux kernel
>> would not permit this.
>>
>> A read-modify-write access would need both READ_ONCE() and WRITE_ONCE().
>> However, since "counter" is thread local and updated only by its owner,
>> we don't need READ_ONCE() here. So:
>>
>> +	WRITE_ONCE(__get_thread_var(counter), __get_thread_var(counter) + 1);
>>
>> should have been sufficient.
>>
>> Problem with this change is that the line gets too wide when applied to
>> the code snippet in 2-column layout.
> 
> Good point -- though renumbering the code is not all -that- hard.
> 
> I clearly should have made a better READ_ONCE() that enforced the same
> constraints as does the Linux kernel, perhaps something like this:
> 
> 	#define READ_ONCE(x) ({ ACCESS_ONCE(x) })
> 
> Thoughts?

I assume you meant:

	#define READ_ONCE(x) ({ ACCESS_ONCE(x); })

I'm afraid this still permits uses such as:

	READ_ONCE(y)++;

Looks like we need a complex definition which resembles that of
include/linux/compiler.h.  Hmm???

And I have another pending question regarding 2/2 of this patch set.
That might result in other addition of line to the code. I think
I can send it tomorrow.

                     Thanks, Akira

> 
> 							Thanx, Paul
> 
>> Hmm...
>>
>>                                  Thanks, Akira
>>
>>>  }
>>>  
>>>  unsigned long read_count(void)
>>>  {
>>> -	return ACCESS_ONCE(global_count);
>>> +	return READ_ONCE(global_count);
>>>  }
>>>  
>>>  void *eventual(void *arg)
>>> @@ -43,8 +43,8 @@ void *eventual(void *arg)
>>>  	while (stopflag < 3) {
>>>  		sum = 0;
>>>  		for_each_thread(t)
>>> -			sum += ACCESS_ONCE(per_thread(counter, t));
>>> -		ACCESS_ONCE(global_count) = sum;
>>> +			sum += READ_ONCE(per_thread(counter, t));
>>> +		WRITE_ONCE(global_count, sum);
>>>  		poll(NULL, 0, 1);
>>>  		if (stopflag) {
>>>  			smp_mb();
>>>
>>
> 
> 

