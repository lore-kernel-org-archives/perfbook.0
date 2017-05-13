Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=WlkgHncJiP6LkmEmbp1WVimgKNXJz/FYHnbgfLQDGLA=;
 b=huiaPuDKToM6zB+Ys72ciz8Wg1e6sS5k5PNmZ3KXQnHy49sJbYy44pCymd3SCHrAIn
 t1CMPCSzKBMbVAIIA0bS6d7GfLKQ/QcWKgqnHgCOITKa+VDrrYPTwzL8FyUBEVGHtwvY
 NsJZyP+8sSOGTB9bTuYtDSZLmAO0r64NnSduoyXveHv7tb0hHL4SSEqukickwe/iQnij
 cPEEBk7JTWliiNd9ZlAV0b49De/ajhMWq5A2qUpD2pQrJl3ee9l3YmLz1cVvS0YVpuOQ
 dofqrpkCrCVK2i62WJbtTx/FuSZ8oOKnTO3qMB8WElsnfGlklmTL3DVUSzT3/lbp337Z
 bK+g==
MIME-Version: 1.0
In-Reply-To: <20170513124556.GJ3956@linux.vnet.ibm.com>
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
 <1494515022-30278-2-git-send-email-junchangwang@gmail.com>
 <61acaa88-abd6-58f5-4d1f-80a2ef58d53e@gmail.com>
 <20170513124556.GJ3956@linux.vnet.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sat, 13 May 2017 21:31:52 +0800
Message-ID: 
 <CABoNC81z6LZm4xrZYsTLqqw5rnf5+epBHZDkVV-qhzOCmdVbyg@mail.gmail.com>
Subject: Re: [PATCH 1/2] count_stat_eventual: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, May 13, 2017 at 8:45 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Sat, May 13, 2017 at 09:04:38PM +0900, Akira Yokosawa wrote:
>> Hi Jason & Paul,
>>
>> although this has already been applied, I have a comment.
>>
>> On 2017/05/11 23:03:41 +0800, Junchang Wang wrote:
>> > Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>> > ---
>> >  CodeSamples/count/count_stat_eventual.c | 8 ++++----
>> >  1 file changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
>> > index 059ab8b..cbde4aa 100644
>> > --- a/CodeSamples/count/count_stat_eventual.c
>> > +++ b/CodeSamples/count/count_stat_eventual.c
>> > @@ -27,12 +27,12 @@ int stopflag;
>> >
>> >  void inc_count(void)
>> >  {
>> > -   ACCESS_ONCE(__get_thread_var(counter))++;
>> > +   READ_ONCE(__get_thread_var(counter))++;
>>
>> This is OK because READ_ONCE() is defined as the same as ACCESS_ONCE()
>> in CodeSamples. However, the definition in the current Linux kernel
>> would not permit this.
>>
>> A read-modify-write access would need both READ_ONCE() and WRITE_ONCE().
>> However, since "counter" is thread local and updated only by its owner,
>> we don't need READ_ONCE() here. So:
>>
>> +     WRITE_ONCE(__get_thread_var(counter), __get_thread_var(counter) + 1);
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
>         #define READ_ONCE(x) ({ ACCESS_ONCE(x) })
>
> Thoughts?

Hi Akira and Paul,

When I was working on the code, my idea was that ACCESS_ONCE() brings
the following benefits:
    1) Clearly underlines the code programmers need to take care.
    2) Prevent compiler from arranging the code.
    3) Remove register/reference hassle.
So, functionally READ_ONCE alone is enough. And it makes the code
'easy' to read :-)

But I agree WRITE_ONCE is logically right here. And it would be better
if the definition in CodeSample is idential to the kernel.


Cheers!
--Jason



>
>
>> Hmm...
>>
>>                                  Thanks, Akira
>>
>> >  }
>> >
>> >  unsigned long read_count(void)
>> >  {
>> > -   return ACCESS_ONCE(global_count);
>> > +   return READ_ONCE(global_count);
>> >  }
>> >
>> >  void *eventual(void *arg)
>> > @@ -43,8 +43,8 @@ void *eventual(void *arg)
>> >     while (stopflag < 3) {
>> >             sum = 0;
>> >             for_each_thread(t)
>> > -                   sum += ACCESS_ONCE(per_thread(counter, t));
>> > -           ACCESS_ONCE(global_count) = sum;
>> > +                   sum += READ_ONCE(per_thread(counter, t));
>> > +           WRITE_ONCE(global_count, sum);
>> >             poll(NULL, 0, 1);
>> >             if (stopflag) {
>> >                     smp_mb();
>> >
>>
>

