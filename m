Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=2J0e6J5ffUa/HuqnlBTUwWIYZWlF0PRnwba4OK4KQbU=;
 b=LmIgGP8pCINvJ8NZM8rq5ZQ0ExzhmfbaQpwlrb4ae9DuRV7xRy2uyg3kndCBlnTUBq
 O4eGgJ21IPD28KIwRJPfx8LaAC6R7yJ5Xqb16OGGaxvE+lMv6BBhTx/s6nUtflJ8j+Lq
 LUTcEFurfPhOYiYSERVmyvrajePT+aqUrVtAsJnfXMx3eO4Zxosnhn+9+b13sReE1+Ym
 SzrrAqbskrlCo1kiM3AqQwx1R4ANL+kqkwjfS+/GZ8ujLCFH7op/tnkZyNgHGDasdJcd
 TkH15kBfT8YbGr5eSdqsKTzzMex7iMtoEzuiaUYf+5fWorhxfCW05hvT9+T2gy2VLy07
 Aiyg==
MIME-Version: 1.0
In-Reply-To: <20171103235504.GT3624@linux.vnet.ibm.com>
References: 
 <CAJYFCiOuj6O18jBM=tWX6wxhXi4sskV-2WYYPvGLgU6LS3aH4w@mail.gmail.com>
 <20171103122719.GH3624@linux.vnet.ibm.com>
 <CAJYFCiPhiFLBjPCjS5DcpcbYphs6bGqwbG94idiDqSVfVsNF8g@mail.gmail.com>
 <20171103140342.GK3624@linux.vnet.ibm.com>
 <CAJYFCiNcZZeAvhLZAj=wxwuEvqGyv7QH9S5r-ehK0eYt+bmy0g@mail.gmail.com>
 <20171103143823.GL3624@linux.vnet.ibm.com>
 <CAJYFCiO3BLYG12vPjMipRAmYFdOgHK19rri1PnR1K9jnfHSARQ@mail.gmail.com>
 <20171103235504.GT3624@linux.vnet.ibm.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Sat, 4 Nov 2017 08:24:09 +0800
Message-ID: 
 <CAJYFCiPtRAXC0QTuhPOZAZutY__NLyJdZZRRTci4tZmkoFDqdQ@mail.gmail.com>
Subject: Re: Invalid compilation without -fno-strict-aliasing
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thanks Paul,

2017-11-04 7:55 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> On Sat, Nov 04, 2017 at 07:26:27AM +0800, Yubin Ruan wrote:
>> Thanks Paul,
>>
>> 2017-11-03 22:38 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
>> > On Fri, Nov 03, 2017 at 10:12:48PM +0800, Yubin Ruan wrote:
>> >> 2017-11-03 22:03 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
>> >> > On Fri, Nov 03, 2017 at 09:33:48PM +0800, Yubin Ruan wrote:
>> >> >> Thanks Paul,
>> >> >>
>> >> >> 2017-11-03 20:27 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
>> >> >> > On Fri, Nov 03, 2017 at 09:54:15AM +0800, Yubin Ruan wrote:
>> >> >> >> Does anyone have any idea why this thread
>> >> >> >>
>> >> >> >>     https://lkml.org/lkml/2003/2/25/270
>> >> >> >
>> >> >> > Hmmm...  This is quite the blast from the past.  Compilers have changed
>> >> >> > a bit in the last 14 years.  Nevertheles...
>> >> >>
>> >> >> Unfortunately I got several old servers with GCC 3.x so I have to keep
>> >> >> an eye on these things (and worse, I am one of those guys who like to
>> >> >> home-brew some locking primitives...)
>> >> >>
>> >> >> >> is related to strict-aliasing? To me, a compiler barrier like this will fix it:
>> >> >> >>
>> >> >> >>     if((stream + event_len) < ends) {
>> >> >> >>         iwe->len = event_len;
>> >> >> >>         barrier();
>> >> >> >>         memcpy(stream, (char *) iwe, event_len);
>> >> >> >>         stream += event_len;
>> >> >> >>     }
>> >> >> >
>> >> >> > As with many bugs, there are a number of ways to fix this one.  I suggest taking
>> >> >> > a look at the documentation for -no-strict-alias.  This stackoverflow URL might
>> >> >> > not be a bad place to start:
>> >> >> >
>> >> >> > https://stackoverflow.com/questions/23848188/strict-aliasing-rule-and-char-pointers
>> >> >>
>> >> >> Basically I understand what aliasing means (for the C/C++ Languages)
>> >> >> and I know what a strict aliasing rule it is. I just cannot see why a
>> >> >> strict aliasing rule will cause this reordering problem...
>> >> >
>> >> > OK.  Then please tell me why exactly you believe that strict aliasing does
>> >> > not allow the compiler to reverse the order of the first two statements
>> >> > in the body of the above "if" statement.
>>
>> I think I understand your point now: if two pointers of different
>> types might reference the same location, then the compiler cannot
>> reverse the statements (just as it is not allowed to reverse the above
>> "iwe->len " and "memcpy" statements).
>>
>> But why is this? After all, the compiler does not know the context.
>
> It is just part of the contract between the compiler and the
> developer.
>
> 1.      If you don't specify -no-strict-alias, then you as the developer
>         are responsible for making sure that no two pointers of different
>         types reference the same location at the same time.  If you fail
>         in this responsibility, as the above example code failed, then
>         the compiler is within its rights to assume that two pointers
>         of different type cannot possibly reference the same location.
>         The compiler is thus free to reorder any such references.
>         (And there is one exception to this rule to allow certain I/O
>         functions to work correctly.)
>
> 2.      If you -do- specify -no-strict-alias, then the responsibility
>         falls on the compiler.  If the compiler cannot prove that a given
>         pair of pointers reference different locations, then the compiler
>         if forced to assume that they might reference the same location.
>         In this case, the compiler is forbidden from reordering the
>         above code.
>
> Why have two approaches?
>
> If you are writing heavy-duty numerical/vector/matrix code, #1 works
> really well, allowing pointers to overlapping portions of matrices
> but still allowing the compiler to undertake valuable optimizations
> that reorder code rather freely.

Much more clear with this valuable insight!

So, without -no-strict-aliasing(that is, enforcing strict aliasing),
the compiler is within its right to assume that the "iwe" and "stream"
above point to different area of memory, and thus can reorder those
two statements rather freely.

I bet that with a more modern compiler, it can recognize the context
because there is a "cha *" type cast there, which indicates that those
two pointers may point to the same address.

Thank you very much;-)
Yubin

> If you are writing the Linux kernel, there is so much use of pointers
> to different types referencing the same data that it the optimizations
> are often destructive.
>
> So that is one reason why both options are available.  There are
> probably others.
>
>                                                         Thanx, Paul
>
>> Thanks,
>> Yubin
>>
>> >> Indeed, the compiler is free to reorder those two statements and
>> >> strict aliasing does not prevent the compiler from doing so. But, from
>> >> my perspective, this reordering issue might just come from some other
>> >> optimization rules (so we have to use barrier()), not because of the
>> >> strict aliasing rule.
>> >>
>> >> Hmm... am I missing anything?
>> >
>> > When you tell gcc -no-strict-aliasing (which is a non-standard extension,
>> > not part of the C language), the compiler is required to allow for the
>> > fact that two pointers of different types might well reference the same
>> > location(s).  In this case, the compiler cannot reverse the statements,
>> > just as it would not be allowed to reverse the order of equivalent
>> > non-pointer statements.
>> >
>> >                                                         Thanx, Paul
>> >
>>
>

