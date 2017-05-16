Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=xcfO4zUCwmB/t1MOUB/al6LGEH70PTlHo2F0d+SGE1A=;
 b=HLhX3LVRnRNfVTtyuO56j9yN4co9y7tQ3wYbFx+LeB5ReNDjwTeeiFthVZ6GT0SJgS
 50tAec+vut/Dw0xNnnRvcK1D8bTCCk6/83KD63nryILAD6FFh5x7UVwjtXzJXTMM73kE
 U0RDruG+0H1WQZkpWH6G4qSHAAVUs52RuA8O5cLqpM62oA9Kxfzmn48dbcSaBwO2p4ag
 lcBbOUTea+OtBRWvdYhGyjrNy/bCaUJ9khhU15B/4SN5LxiFNT599OxGIYUeNH3Tnxvn
 iGQLH58QPbq56bzfwDkFYBgKUG3E4ew6b4fqETO3nqfy5zGtaxZdeH003IC1jzlGRD/t
 4ngg==
MIME-Version: 1.0
In-Reply-To: <255c194b-0424-ff3c-ac4b-e0cb8b372e10@gmail.com>
References: <1494942026-6736-1-git-send-email-junchangwang@gmail.com>
 <CABoNC830pyg6WnFs6-Pk5x0PvkrZksyrhbAE_WZtrH4oOW3F-A@mail.gmail.com>
 <255c194b-0424-ff3c-ac4b-e0cb8b372e10@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Tue, 16 May 2017 23:46:45 +0800
Message-ID: 
 <CABoNC83tNsC40DtOW6Ogs6iomsBYq3eb_OOQ6QG4r+szpqeCfA@mail.gmail.com>
Subject: Re: [PATCH] count_stat_eventual: Remove unnecessary READ_ONCE() and
 smp_mb()
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

Thanks a lot for commenting on the patch. Just sent the patch version 2.


Cheers!
--Jason


On Tue, May 16, 2017 at 11:05 PM, Akira Yokosawa <akiyks@gmail.com> wrote:
> On 2017/05/16 22:04:59 +0800, Junchang Wang wrote:
>> Hi Paul and Akira,
>>
>> This is the updated patch according to the discussion with Akira and
>> following is the summary. Please take a look. Comments are welcome!
>>
>> In function eventual( ), if the value of stopflag become larger than
>> zero (the ''if'' branch is taken), then only the "eventual()" thread
>> updates stopflag. So, the READ_ONCE() within the WRITE_ONCE() is not
>> necessary. Remove it.
>> In function count_cleanup( ), there is no need to run smp_mb( ) in
>> between statement writing to and statement reading from the same
>> variable, stopflag. Remove smp_mb().
>>
>>
>> Thanks,
>> --Jason
>>
>> On Tue, May 16, 2017 at 9:40 PM, Junchang Wang <junchangwang@gmail.com> wrote:
>>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>
> Hi Jason,
>
> Glad to know you agree with me here!
>
> Can you resubmit a v2 of the patch to include the message above in the commit
> log?  It would be easier for Paul to apply.
> Also, since I didn't created the patch itself, I'd like you to use the following
> tag instead:
>
> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
>
> in front of your Signed-off-by.
>
>                  Thanks, Akira
>
>>> ---
>>>  CodeSamples/count/count_stat_eventual.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
>>> index 464de30..1365168 100644
>>> --- a/CodeSamples/count/count_stat_eventual.c
>>> +++ b/CodeSamples/count/count_stat_eventual.c
>>> @@ -40,16 +40,17 @@ void *eventual(void *arg)
>>>  {
>>>         int t;
>>>         unsigned long sum;
>>> +       int stopflag_l = 0;
>>>
>>> -       while (READ_ONCE(stopflag) < 3) {
>>> +       while (stopflag_l < 3) {
>>>                 sum = 0;
>>>                 for_each_thread(t)
>>>                         sum += READ_ONCE(per_thread(counter, t));
>>>                 WRITE_ONCE(global_count, sum);
>>>                 poll(NULL, 0, 1);
>>> -               if (READ_ONCE(stopflag)) {
>>> +               if ((stopflag_l = READ_ONCE(stopflag)) != 0) {
>>>                         smp_mb();
>>> -                       WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
>>> +                       WRITE_ONCE(stopflag, ++stopflag_l);
>>>                 }
>>>         }
>>>         return NULL;
>>> @@ -68,7 +69,6 @@ void count_init(void)
>>>  void count_cleanup(void)
>>>  {
>>>         WRITE_ONCE(stopflag, 1);
>>> -       smp_mb();
>>>         while (READ_ONCE(stopflag) < 3)
>>>                 poll(NULL, 0, 1);
>>>         smp_mb();
>>> --
>>> 2.7.4
>>>
>>
>

