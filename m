Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=NmKs1ek8BJb9+uDXy00hhaMcw7BwVbTlViOoPh0GAFM=;
 b=ilfT4/m8PO5xeiUzToqzffRtXfY6uCLA6AU76Dek3OLqqqfLABuFJagdjnNQIXa3+L
 CgV7diHm6Zv67vfRv3JVZVBNnILUduji5RTO0Si2az0rN0FeLc8PnOAZErXBjYiOjoCd
 5Nn9u0r9OPvCTuWBzg/3iATxqhm9vjjZfxC8LtJOlnmCHXoGesSsCU1HrmeJeVyzwwCr
 mx1Oy105rk9juU+xZOGXotUsj03BmjbwYKTQ8KLI2ujyiCO1PFqi4uDBgZaTB5oVXQ4/
 PkRhn7UipGriCtRicOWlZSrLsPEr32PYD56fOkpJN+/hiyWUCVubjt4dxieHn0QZMsR1
 xfww==
MIME-Version: 1.0
In-Reply-To: <20170509154049.GQ3956@linux.vnet.ibm.com>
References: <1494306511-9022-1-git-send-email-junchangwang@gmail.com>
 <1494306511-9022-3-git-send-email-junchangwang@gmail.com>
 <20170509144730.GL3956@linux.vnet.ibm.com>
 <CABoNC80ZDZKjMWkT7HHnDGikMpYf5M7sMnM2E_-8gftGKRFHtQ@mail.gmail.com>
 <20170509154049.GQ3956@linux.vnet.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Wed, 10 May 2017 07:11:06 +0800
Message-ID: 
 <CABoNC8037z_VNT_iwcpFMczvsU_W=PCzTJ9pzO5AN1ZxF83zgw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Remove unnecessary memory fence
Content-Type: text/plain; charset=UTF-8
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Thanks a LOT for the references. They are pretty much helpful :-). I
need a deeper look into it (and of course think about it) and will
submit new patches by tomorrow.


Thanks,
--Jason


On Tue, May 9, 2017 at 11:40 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Tue, May 09, 2017 at 11:20:01PM +0800, Junchang Wang wrote:
>> Hi Paul,
>>
>> Thanks a lot for the correction. Thanks's right; we need to care about
>> other achitectures :-)
>>
>> So barrier() is basically empty: define barrier() __asm__
>> __volatile__("": : :"memory") . I'm curious about what on the earth it
>> does? We do really use it in counttorture.h. Any reference to
>> resources is welcome!
>>
>> Even if we agree with smp_mb(), count_stat_eventual.c seems not 100%
>> correct for me. Please check the following patch. It seems to me the
>> barrier instruction (smp_mb) in function count_cleanup is to make RAW
>> correct. So it should be inserted between the write and read
>> instructions. Is that right?
>
> Well, part of your change is in the right direction.  Either stopflag
> needs to be volatile or the accesses to stopflag need to use READ_ONCE()
> or WRITE_ONCE(), with the latter preferred.
>
> I suggest looking at this Linux Weekly News (LWN) series:
>
>         https://lwn.net/Articles/718628/
>         https://lwn.net/Articles/720550/
>
> This LWN article talks about use of ACCESS_ONCE(), which is the
> predecessor to READ_ONCE() and WRITE_ONCE():
>
>         http://lwn.net/Articles/508991/
>
> So I would welcome a patch that applied READ_ONCE() and WRITE_ONCE()
> to the stopflag variable.  Given that some of this code was written
> before ACCESS_ONCE(), let alone READ_ONCE() and WRITE_ONCE(), there
> might be more code needing this change, so please feel free to take
> a look around.
>
>                                                         Thanx, Paul
>
>> index 75a0ca9..32f7e80 100644
>> --- a/CodeSamples/count/count_stat_eventual.c
>> +++ b/CodeSamples/count/count_stat_eventual.c
>> @@ -67,9 +67,9 @@ void count_init(void)
>>  void count_cleanup(void)
>>  {
>>         stopflag = 1;
>> +       smp_mb();
>>         while (stopflag < 3)
>>                 poll(NULL, 0, 1);
>> -       smp_mb();
>>  }
>>
>>  #include "counttorture.h"
>> --
>> 2.7.4
>>
>>
>> Thanks,
>> --Jason
>>
>> On Tue, May 9, 2017 at 10:47 PM, Paul E. McKenney
>> <paulmck@linux.vnet.ibm.com> wrote:
>> > On Tue, May 09, 2017 at 01:08:31PM +0800, Junchang Wang wrote:
>> >> count_stat_eventual.c uses a single global variable (stopflag) to synchronize
>> >> two separate threads (main and eventual) probably running on two different CPU
>> >> cores. My understanding is that for this model, memory fence instruction
>> >> (mfence) which typically are expensive can be avoided, only if we make sure (1)
>> >> that compiler neither reorder the code around nor cache the variable, and (2)
>> >> that the CPU core running code precedes in program order.
>> >>
>> >> We use keyword ``volatile'' to prevent compilers from reordering the code and
>> >> caching the variable, and instruction barrier() to force CPU core running the
>> >> code to obey program order.
>> >
>> > Please take another look at the barrier() macro.  It does not emit any
>> > instructions, so cannot force the CPU to do much of anything.  Keep in
>> > mind that this code needs to run on weakly ordered systems, not just x86.
>> >
>> >                                                         Thanx, Paul
>> >
>> >> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>> >> ---
>> >>  CodeSamples/count/count_stat_eventual.c | 6 +++---
>> >>  1 file changed, 3 insertions(+), 3 deletions(-)
>> >>
>> >> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
>> >> index 059ab8b..5ffc4aa 100644
>> >> --- a/CodeSamples/count/count_stat_eventual.c
>> >> +++ b/CodeSamples/count/count_stat_eventual.c
>> >> @@ -23,7 +23,7 @@
>> >>
>> >>  DEFINE_PER_THREAD(unsigned long, counter);
>> >>  unsigned long global_count;
>> >> -int stopflag;
>> >> +volatile int stopflag;
>> >>
>> >>  void inc_count(void)
>> >>  {
>> >> @@ -47,7 +47,7 @@ void *eventual(void *arg)
>> >>               ACCESS_ONCE(global_count) = sum;
>> >>               poll(NULL, 0, 1);
>> >>               if (stopflag) {
>> >> -                     smp_mb();
>> >> +                     barrier();
>> >>                       stopflag++;
>> >>               }
>> >>       }
>> >> @@ -67,9 +67,9 @@ void count_init(void)
>> >>  void count_cleanup(void)
>> >>  {
>> >>       stopflag = 1;
>> >> +     barrier();
>> >>       while (stopflag < 3)
>> >>               poll(NULL, 0, 1);
>> >> -     smp_mb();
>> >>  }
>> >>
>> >>  #include "counttorture.h"
>> >> --
>> >> 2.7.4
>> >>
>> >> --
>> >> To unsubscribe from this list: send the line "unsubscribe perfbook" in
>> >> the body of a message to majordomo@vger.kernel.org
>> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> >>
>> >
>>
>

