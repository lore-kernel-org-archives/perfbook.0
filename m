Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=rIeO8Uk1rbivEFAW40Sy4WBEKzA/iUQIyf8WhhibKS0=;
 b=EPTzMRH487einnrPoEM9c6lOByDDUVh/mCmyhD0E9khO0Tb5anPibPDRaO35bNtbf5
 LzNlYhXsOrGZS3KN5xbAIqUrHCKRmEHADoulBHZdWzDUcEsdn4zY4sghJMFdGivYSqqF
 9+iK3LkBxjq/eXNCMg1e0y1095yks4OHx97WjwQ0Mo/S0dtpAsrqaydM2CUPnYc/fyo7
 NKwHsDjHIxRAgzVbUR60kxnJoG1xpMW/gUqTl/GPiR30TgfPY1LbfSBrNpjnutcsv5cq
 V8sgsvI2RxlJ0dLjCJMstSPrbMd3mglEJVCnhBZqinLNwmzysXvlZ4Y+43uXYSEDbzuo
 MV7g==
MIME-Version: 1.0
In-Reply-To: <20171103143823.GL3624@linux.vnet.ibm.com>
References: 
 <CAJYFCiOuj6O18jBM=tWX6wxhXi4sskV-2WYYPvGLgU6LS3aH4w@mail.gmail.com>
 <20171103122719.GH3624@linux.vnet.ibm.com>
 <CAJYFCiPhiFLBjPCjS5DcpcbYphs6bGqwbG94idiDqSVfVsNF8g@mail.gmail.com>
 <20171103140342.GK3624@linux.vnet.ibm.com>
 <CAJYFCiNcZZeAvhLZAj=wxwuEvqGyv7QH9S5r-ehK0eYt+bmy0g@mail.gmail.com>
 <20171103143823.GL3624@linux.vnet.ibm.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Sat, 4 Nov 2017 07:26:27 +0800
Message-ID: 
 <CAJYFCiO3BLYG12vPjMipRAmYFdOgHK19rri1PnR1K9jnfHSARQ@mail.gmail.com>
Subject: Re: Invalid compilation without -fno-strict-aliasing
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thanks Paul,

2017-11-03 22:38 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> On Fri, Nov 03, 2017 at 10:12:48PM +0800, Yubin Ruan wrote:
>> 2017-11-03 22:03 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
>> > On Fri, Nov 03, 2017 at 09:33:48PM +0800, Yubin Ruan wrote:
>> >> Thanks Paul,
>> >>
>> >> 2017-11-03 20:27 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
>> >> > On Fri, Nov 03, 2017 at 09:54:15AM +0800, Yubin Ruan wrote:
>> >> >> Does anyone have any idea why this thread
>> >> >>
>> >> >>     https://lkml.org/lkml/2003/2/25/270
>> >> >
>> >> > Hmmm...  This is quite the blast from the past.  Compilers have changed
>> >> > a bit in the last 14 years.  Nevertheles...
>> >>
>> >> Unfortunately I got several old servers with GCC 3.x so I have to keep
>> >> an eye on these things (and worse, I am one of those guys who like to
>> >> home-brew some locking primitives...)
>> >>
>> >> >> is related to strict-aliasing? To me, a compiler barrier like this will fix it:
>> >> >>
>> >> >>     if((stream + event_len) < ends) {
>> >> >>         iwe->len = event_len;
>> >> >>         barrier();
>> >> >>         memcpy(stream, (char *) iwe, event_len);
>> >> >>         stream += event_len;
>> >> >>     }
>> >> >
>> >> > As with many bugs, there are a number of ways to fix this one.  I suggest taking
>> >> > a look at the documentation for -no-strict-alias.  This stackoverflow URL might
>> >> > not be a bad place to start:
>> >> >
>> >> > https://stackoverflow.com/questions/23848188/strict-aliasing-rule-and-char-pointers
>> >>
>> >> Basically I understand what aliasing means (for the C/C++ Languages)
>> >> and I know what a strict aliasing rule it is. I just cannot see why a
>> >> strict aliasing rule will cause this reordering problem...
>> >
>> > OK.  Then please tell me why exactly you believe that strict aliasing does
>> > not allow the compiler to reverse the order of the first two statements
>> > in the body of the above "if" statement.

I think I understand your point now: if two pointers of different
types might reference the same location, then the compiler cannot
reverse the statements (just as it is not allowed to reverse the above
"iwe->len " and "memcpy" statements).

But why is this? After all, the compiler does not know the context.

Thanks,
Yubin

>> Indeed, the compiler is free to reorder those two statements and
>> strict aliasing does not prevent the compiler from doing so. But, from
>> my perspective, this reordering issue might just come from some other
>> optimization rules (so we have to use barrier()), not because of the
>> strict aliasing rule.
>>
>> Hmm... am I missing anything?
>
> When you tell gcc -no-strict-aliasing (which is a non-standard extension,
> not part of the C language), the compiler is required to allow for the
> fact that two pointers of different types might well reference the same
> location(s).  In this case, the compiler cannot reverse the statements,
> just as it would not be allowed to reverse the order of equivalent
> non-pointer statements.
>
>                                                         Thanx, Paul
>

