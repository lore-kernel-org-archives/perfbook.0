Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=l1hWeYtSPImJvbEQnegp/mNA8MFBkSo718b9xse8r2A=;
 b=QfT/6SakBocjFn5xUdSKR0SRQ6BlYfbJqu52tPC++vqGuBKOZLH+ihl2yyd/Cxet6U
 vdJHCBLTg+Zbm3Ao7cSYXUjdmfWEI65ohd8tRHDKfkhs9e1BinUDsbyMmYjf5fPLzgPt
 QmIUUwHX6PY7Aj9clHKhxJ1/jktqAenQDFvoLitnLi5z3lNaffOokRVSDwURoAB5z4DY
 AYmHvelcmV4Lot1JRux3knEKpNIdMCyFRekMcwdeL35wS6C6eRH+C17Kn2c2W6Z/6O5w
 4Zp6rQduYYgzu1bftemvujcVQSQeEVSX9hwQNrqtsQbt8sbUvkpF/NLceI01Pn84uFy1
 zlxA==
MIME-Version: 1.0
In-Reply-To: <20170601041921.GX3956@linux.vnet.ibm.com>
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
 <8e20cd05-59f8-f651-d0e0-1db2a7105d33@gmail.com>
 <20170531184655.GR3956@linux.vnet.ibm.com>
 <CABoNC81zFyS5e3dqDRGg9DMwAmzz2_eOYLr_5zQE0YZ4MKp83g@mail.gmail.com>
 <20170601041921.GX3956@linux.vnet.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Thu, 1 Jun 2017 12:34:28 +0800
Message-ID: 
 <CABoNC83+aTGGoJHeNjxGrh=ufBOmsp+vYNDe+UbShz-=RLatYw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] CodeSamples: Cleanups and fixes
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, Jun 1, 2017 at 12:19 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Thu, Jun 01, 2017 at 09:45:02AM +0800, Junchang Wang wrote:
>> Hi Paul and Akira,
>>
>> The code looks clear and easy to understand now :-).
>
> Glad you like it!  I am sure that other code in there could use
> similar help.

I would be very happy to gradually go through these sections this summer. :-)

>
>> While checking the patch, I have one question. Are there any technical
>> reason that we prefer for(;;) instead of while(1) in CodeSamples? Just
>> out of curiosity :-)
>
> No.  Just thirty-five years of habit plus the preferences of the Linux
> kernel community.  And the latter are probably because "while (1)"
> has one more character than does "for (;;)".  ;-)
>

Got you :-)  Thanks.

--Jason

>                                                         Thanx, Paul
>
>> Thanks
>>
>> On Thu, Jun 1, 2017 at 2:46 AM, Paul E. McKenney
>> <paulmck@linux.vnet.ibm.com> wrote:
>> > On Tue, May 30, 2017 at 09:05:15PM +0900, Akira Yokosawa wrote:
>> >> >From 489b5e3bdeba2f9b733dbe3d85390368dd159174 Mon Sep 17 00:00:00 2001
>> >> From: Akira Yokosawa <akiyks@gmail.com>
>> >> Date: Tue, 30 May 2017 20:44:52 +0900
>> >> Subject: [RFC PATCH v2 0/2] CodeSamples: Cleanups and fixes
>> >>
>> >> Hi Paul,
>> >>
>> >> This is the respin of the latter two patches of v1. I'm keeping RFC
>> >> because of some questions.
>> >>
>> >> "long" -> "intptr_t" changes in Patch 1 have no effect on a platform
>> >> where "long" and "intptr_t" have the same width, but I think they
>> >> are good in portability POV.
>> >>
>> >> WRITE_ONCE() in Patch 2 is placed under the assignment to the array
>> >> because I could not translate post increment in any other way.
>> >> Does the WRITE_ONCE() ensure the outer "while" capture the value?
>> >
>> > Wow, that loop is old code!!!  My current compiler creates an infinite
>> > loop for it, so yes, there is more required.   Plus there are confusing
>> > and redundant comparisons, so that it is not entirely clear to me that
>> > the loop is guaranteed to terminate properly.
>> >
>> > So I took both patches, but rewrote the loop in the second patch as
>> > shown below.
>> >
>> > If you are OK with this rewrite, I will push them.
>> >
>> >                                                         Thanx, Paul
>> >
>> > ------------------------------------------------------------------------
>> >
>> > commit 8a54d9aeeeefa1909db062dc893705ff8fefd702
>> > Author: Akira Yokosawa <akiyks@gmail.com>
>> > Date:   Tue May 30 20:40:04 2017 +0900
>> >
>> >     CodeSamples/defer: Rework loop in gettimestampmp.c
>> >
>> >     Add READ_ONCE() and WRITE_ONCE() ensure curtimestamp is read and written
>> >     once in every iteration.  The READ_ONCE() is not optional, as modern
>> >     compilers can (and do) emit an infinite loop for the earlier code.
>> >
>> >     Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> >     [ paulmck: Rework loop to eliminate redundant fetches and comparisons. ]
>> >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>> >
>> > diff --git a/CodeSamples/defer/gettimestampmp.c b/CodeSamples/defer/gettimestampmp.c
>> > index 2abade42e233..8780b71f33d7 100644
>> > --- a/CodeSamples/defer/gettimestampmp.c
>> > +++ b/CodeSamples/defer/gettimestampmp.c
>> > @@ -30,16 +30,19 @@ long curtimestamp = 0;
>> >  void *collect_timestamps(void *mask_in)
>> >  {
>> >         long mask = (intptr_t)mask_in;
>> > +       long cts;
>> >
>> > -       while (curtimestamp < MAX_TIMESTAMPS) {
>> > -               while ((curtimestamp & CURTIMESTAMP_MASK) != mask)
>> > -                       continue;
>> > -               if (curtimestamp >= MAX_TIMESTAMPS)
>> > +       for (;;) {
>> > +               cts = READ_ONCE(curtimestamp);
>> > +               if (cts >= MAX_TIMESTAMPS)
>> >                         break;
>> > +               if ((cts & CURTIMESTAMP_MASK) != mask)
>> > +                       continue;
>> >
>> >                 /* Don't need memory barrier -- no other shared vars!!! */
>> >
>> > -               ts[curtimestamp++] = get_timestamp();
>> > +               ts[cts] = get_timestamp();
>> > +               WRITE_ONCE(curtimestamp, cts + 1);
>> >         }
>> >         smp_mb();
>> >         return (NULL);
>> >
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe perfbook" in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>

