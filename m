Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=RAYkiexrdTgmXLchGTpZ0XRs6TDpmMrBRU0xEYtf7y0=;
 b=sRJp6Nz107heI16bW6Su/2U+kSR7zHd4Q5itO/SCzmdqfBkEH0WNPnaiz+1uM4jCDE
 IW/rnX2jI7s0g4SSyeGL6t91CBhjD+yQN7t1VTC1JuqBfFWJWHdKgnNHSumLLXHr1BsE
 Bp8xVctDhCTtn7/gUTN/H5qj3LOgswYNNbsmm+rS+Wn9FSrM+14m0s1DzQnXkvSpoZm5
 wZLUXvMF+Gjo858P/9b7WQIZ0Y5n6PvPF9VCq/wJyRO4sgWaRsPYTiXcAi7qe8t8+ZR/
 5j/d7dQv7z3HAWOCv/X0VoEX9N8P9aVvMmXyuNiWtS2tBvo2x/5U+LDRlcgtcSZyutiv
 2LOA==
MIME-Version: 1.0
In-Reply-To: <20171103140342.GK3624@linux.vnet.ibm.com>
References: 
 <CAJYFCiOuj6O18jBM=tWX6wxhXi4sskV-2WYYPvGLgU6LS3aH4w@mail.gmail.com>
 <20171103122719.GH3624@linux.vnet.ibm.com>
 <CAJYFCiPhiFLBjPCjS5DcpcbYphs6bGqwbG94idiDqSVfVsNF8g@mail.gmail.com>
 <20171103140342.GK3624@linux.vnet.ibm.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Fri, 3 Nov 2017 22:12:48 +0800
Message-ID: 
 <CAJYFCiNcZZeAvhLZAj=wxwuEvqGyv7QH9S5r-ehK0eYt+bmy0g@mail.gmail.com>
Subject: Re: Invalid compilation without -fno-strict-aliasing
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

2017-11-03 22:03 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> On Fri, Nov 03, 2017 at 09:33:48PM +0800, Yubin Ruan wrote:
>> Thanks Paul,
>>
>> 2017-11-03 20:27 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
>> > On Fri, Nov 03, 2017 at 09:54:15AM +0800, Yubin Ruan wrote:
>> >> Does anyone have any idea why this thread
>> >>
>> >>     https://lkml.org/lkml/2003/2/25/270
>> >
>> > Hmmm...  This is quite the blast from the past.  Compilers have changed
>> > a bit in the last 14 years.  Nevertheles...
>>
>> Unfortunately I got several old servers with GCC 3.x so I have to keep
>> an eye on these things (and worse, I am one of those guys who like to
>> home-brew some locking primitives...)
>>
>> >> is related to strict-aliasing? To me, a compiler barrier like this will fix it:
>> >>
>> >>     if((stream + event_len) < ends) {
>> >>         iwe->len = event_len;
>> >>         barrier();
>> >>         memcpy(stream, (char *) iwe, event_len);
>> >>         stream += event_len;
>> >>     }
>> >
>> > As with many bugs, there are a number of ways to fix this one.  I suggest taking
>> > a look at the documentation for -no-strict-alias.  This stackoverflow URL might
>> > not be a bad place to start:
>> >
>> > https://stackoverflow.com/questions/23848188/strict-aliasing-rule-and-char-pointers
>>
>> Basically I understand what aliasing means (for the C/C++ Languages)
>> and I know what a strict aliasing rule it is. I just cannot see why a
>> strict aliasing rule will cause this reordering problem...
>
> OK.  Then please tell me why exactly you believe that strict aliasing does
> not allow the compiler to reverse the order of the first two statements
> in the body of the above "if" statement.

Indeed, the compiler is free to reorder those two statements and
strict aliasing does not prevent the compiler from doing so. But, from
my perspective, this reordering issue might just come from some other
optimization rules (so we have to use barrier()), not because of the
strict aliasing rule.

Hmm... am I missing anything?

Yubin

