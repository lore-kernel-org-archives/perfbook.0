Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=SL5Unp6C+DLoY6ddDW5yclPLGziBVwH+n3VgmCDlgCI=;
 b=gyGW9dRvQBxS/5De8UgcnJJTXx0nwJ/Tfg6n3GK/GyunSfe7y3rE1BnfVfZLGkUAQp
 1emD6s+jW762o5n2ik/AcgkZVGuYGfaz0VV+V85bX41f7wPYtHzmK9nb6JrXYGrKcxlk
 MSI/5SkiG1/iEfzW9ZRsqRXW42kCOPlfvZiFhRgim2YWEbSgvgQPEP9fgGyQkZLhvVp7
 jgsfKTwF1daIGIr+1yH4lBS8IThOAWlLimM7fKljLUsM9m6JNk5/F/tIQaivmNcyjw6p
 hldDZkD3+yYAufXMMVFqxsDT5wNo38hcws5vPbK0iPa6PnRCCDZaoCkNEZR+b7enoeb9
 3zvw==
MIME-Version: 1.0
In-Reply-To: <20171127180501.GH3624@linux.vnet.ibm.com>
References: <31ffe8fa-8787-7554-ce37-285cb0961a26@gmail.com>
 <20171118191913.GJ3624@linux.vnet.ibm.com>
 <af00bd8f-245b-7a11-b110-91d6b95d152e@gmail.com>
 <20171120174344.GT3624@linux.vnet.ibm.com>
 <2241e3df-7540-e0a3-245c-d72348817579@gmail.com>
 <20171127180501.GH3624@linux.vnet.ibm.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Tue, 28 Nov 2017 10:07:05 +0800
Message-ID: 
 <CAJYFCiONjmu_ys-2oFAqAsE2fCcE5giMYK=QF3bWTnuZPVmrPQ@mail.gmail.com>
Subject: Re: Julia language
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org, Duzhong Chen <cdzos97@gmail.com>
List-ID: <perfbook.vger.kernel.org>

2017-11-28 2:05 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> On Tue, Nov 21, 2017 at 07:39:01AM +0900, Akira Yokosawa wrote:
>> On 2017/11/20 09:43:44 -0800, Paul E. McKenney wrote:
>> > On Sun, Nov 19, 2017 at 09:30:54AM +0900, Akira Yokosawa wrote:
>> >> On 2017/11/19 4:19, Paul E. McKenney wrote:
>> >>> On Fri, Nov 17, 2017 at 12:43:19AM +0900, Akira Yokosawa wrote:
>> >>>> Hi Paul,
>> >>>>
>> >>>> Have you heard of "Julia" language?
>> >>>>
>> >>>> JFYI,
>> >>>> As can be seen in its official page at https://julialang.org/ and a Wikipedia
>> >>>> article at https://en.wikipedia.org/wiki/Julia_(programming_language),
>> >>>> it looks like one of promising answers to perfbook's Section 2.2 "Parallel
>> >>>> Programming Goals".
>> >>>>
>> >>>> As long as high-performance number crunching is concerned, it claims to have
>> >>>> comparable performance to C, with a programming productivity much better
>> >>>> than C + MPI.
>> >>>>
>> >>>> Note: I'm not a user of the language at the moment. I just heard of it at
>> >>>> a twitter hashtag #julialang.
>> >>>>
>> >>>> I'd like you to check it up and (hopefully) update the above mentioned
>> >>>> section in perfbook.
>> >>>
>> >>> I had heard of it, but I had not heard of it being seriously proposed
>> >>> as the answer to Section 2.2.  I have added it to todo.txt with your
>> >>> Reported-by.
>> >>>
>> >>> Have you or has someone you know used this for a large parallel-programming
>> >>> project?  (Just looking for some real-world confirmation.)
>> >>
>> >> So you want a secondary-source info on the real-world use?
>> >>
>> >> I learned of Julia from Gen Kuroki's twitter activity since this June.
>> >> He is a mathematician at Tohoku Univiersity, and experimenting/demonstrating
>> >> Monte Carlo analysis of several statistic problems using Julia (on a Windows PC!).
>> >> But what he is doing right now doesn't qualify as a _large_ parallel-programming
>> >> project.
>> >>
>> >> There is a case-studies page at https://juliacomputing.com/case-studies/,
>> >> but this should be regarded as a primary source.
>> >>
>> >> One of the case study, "Deep Learning for Medical Diagnosis" at
>> >> https://juliacomputing.com/case-studies/ibm.html, looks like a collaboration
>> >> of IBM and Juliacomputing.
>> >>
>> >> Could this qualify as a real-world large parallel programming example?
>> >
>> > Maybe...  Some evaluation and a proposal at the end...
>> >
>> > But please understand that 40+ years working in this field has made me
>> > deeply skeptical of sweeping claims for new languages.  Now, don't get
>> > me wrong, Julia might well be great stuff that deserves mention in the
>> > book, but let's first take a quick look at history.
>> >
>> > Let's start with my employer, IBM.  This URL is informative:
>> >
>> > http://www.softwarepreservation.org/projects/FORTRAN/BackusEtAl-Preliminary%20Report-1954.pdf
>> >
>> > This is a 1954 report on the specifications for FORTRAN, reportedly
>> > co-authored by none other than John Backus.  Please see page 3, first
>> > full paragraph:
>> >
>> >     Since FORTRAN should virtually eliminate coding and debugging,
>> >     it should be possible to solve problems for less than half the
>> >     cost that would be required without such a system.
>> >
>> > To be fair, they were comparing coding in FORTRAN to coding in IBM 704
>> > assembly language, but still, my use of FORTRAN in the 1970s involved
>> > -significant- coding and debugging.  ;-)
>>
>> I suppose it was the only language you could choose.
>>
>> >
>> > Julia's case-studies page is impressive, but at first glance it appears
>> > to mostly be centered on HPC, which leads me to question the "generality"
>> > part of the iron triangle of parallel programming.  Gen Kuroki's use
>> > case seems to be in a similar area.
>>
>> As I said in the first mail in this thread:
>>
>>     >>>> As long as high-performance number crunching is concerned, [...]
>>
>> I was not sure of "generality" either.
>>
>> >
>> > So what to do?
>> >
>> > For the upcoming release, nothing.  After all, it is only a few days away.
>> >
>> > But perhaps later it might be good to expand Section 17.4 ("Functional
>> > Programming for Parallelism") to cover languages instead of just
>> > functional programming.  Julia might fit in here, as might Rust (given
>> > the ownership aspects of its type system), Go (another popular parallel
>> > system), and maybe even Python (because everyone and their dog seems
>> > to use it).
>> >
>> > Does that seem reasonable?
>>
>> Sounds good!
>>
>> Julia seems the youngest one among them.
>> We can wait for (say) a few years to see where it goes, I suppose.
>
> And here is Eric Raymond's take on this:  http://esr.ibiblio.org/?p=7724
>
> Thoughts?

As for the C programming language, if it would have hygienic macros,
it will be a great pleasure because that will enable you to "generate
programs", syntactically and semantically. I am not that
security-oriented and I care so much about performance and control of
my programs, so from this perspective C is more tasty than other GC
languages. Really, C is "elegant & powerful" for me.

And the memory error problem "caused" by C is indeed a drawback, but
C++ doesn't not solve it entirely. Instead, C++ makes writing
spaghetti code more easily. The only thing I love about C++ is its
template, because writing template makes me...feel good (yes, the
complexity make me feel good. And also, template enables you to
generate code "automatically")

Another very important thing for me, from the perspective of
programming languages: type system. I am really not a fans of
scripting languages which does not enforce strict typing. They are too
"error prone" for writing programs. Having a program running four
hours and throw out a syntax error is really no fun.

What about programming languages for parallel programming? Well, it
will be great to have a programming language with a builtin parallel
programming paradigm so that programmers will not have to struggle
with those messy race conditions and will have more time to enjoy
coffee and tea as others people in the sunshine. But, as David Wheeler
will say, "all problems in computer science can be solved by another
level of indirection", we the programmer can achieve things in more
than one way. We should not be restricted to programming languages
when thinking about parallel programming. Things like MapReduce is a
good example of doing thing parallel, above the languages.

P.S., Eric Raymond's post make me feel that writing is really really
important ;-)


        Yubin

