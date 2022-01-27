Return-Path: <SRS0=rWVQ=SL=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=25xSoMcYtW/sa+B0EtpoGRktxksG8+9Xfh6EMmrs3sY=;
        b=OSIVHREAY9wU2uNcn28YbbN2jmNjnVXGW7o8Qn3N6MEf1mCDBV9Oz1F/aZcddm41Pe
         9ZqpwZ9hvzWKk/5cbHU3LajkKuUDghs78GzPO0+pZBEHPzVpaZZJz1v7qJTPW9UDawVy
         fR9PWXc/JxJ3p8RAp/wBGHy5JZmuPnT8Kr6kl83hN647Lw+iQx11g9/4QwVDHoFCFlGx
         +u77DZdbNW/QvCHOxiLMQKKU5U06MWlhNRFhbAPLAgiJwdAJO+7wMi3rCfVIXCwGIVN2
         mjPmmOVU1+3xAVbn05hoRe9IUvUn2nVpYjho/w9KEiQweuXhoiPGlTJvKhWLl4MPORg4
         gRjQ==
Message-ID: <4ba47042-bcfa-7635-956a-0168ad6fa827@gmail.com>
Date: Thu, 27 Jan 2022 15:07:17 +0900
MIME-Version: 1.0
Subject: Re: [RFT PATCH -perfbook] Enable parallel runs of pdflatex
Content-Language: en-US
References: <b27908db-9717-5d37-12ea-05dda137dd55@gmail.com>
 <20220127044530.GD4285@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220127044530.GD4285@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 26 Jan 2022 20:45:30 -0800,
Paul E. McKenney wrote:
> On Thu, Jan 27, 2022 at 10:51:25AM +0900, Akira Yokosawa wrote:
>> Parallel build of PDF figures and .fcv snippets by "make -jN" worked
>> when a single PDF target was given to "make", such as
>> "make neatfreak; make -j4 eb".
>> On the other hand, "make -j3 2c 1c eb" ended up in various errors
>> during parallel runs of pdflatex.
>>
>> It turns out that the cause of the error is the \include{} commands
>> in appendix/appendix.tex and perfbook-lt.tex.
>> \include{} switches to its own .aux file, in this case,
>> appendix/questions.aux, appendix/toyrcu.aux, and so on.
>> As their names are common to different PDF targets, those .aux files
>> can be overwritten/corrupted by parallel runs of pdflatex.
>>
>> \include{} implies \cleardoublepage both in front of and next to it.
>> In perfbook, included LaTeX sources have \chapter{} commands and
>> the implied page breaks are redundant.
>>
>> By replacing \include{} with \input{}, parallel runs of pdflatex can
>> be enabled.
>>
>> There were a couple of minor issues in Makefile WRT parallel runs of
>> runfirstlatex.sh.
>>
>> When some of perfbook-xxx.tex files already existed, runfirstlatex.sh
>> for other main perfbook-yyy.tex could be invoked prematurely before
>> that .tex file was ready.
>>
>> Fix it by adding stricter dependencies of perfbook-xxx.aux on
>> perfbook-xxx.tex.
>> Also remove some redundant dependencies around here.
>>
>> Note: LATEXSOURCES contains perfbook-lt.tex
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Hi Paul,
>>
>> For quite a while, I was wondering why "make -j3 2c 1c eb"
>> didn't work as expected.
>>
>> I think I have managed to get it work.
>>
>> But changes in Makefile need extra testing.  Especially,
>> those involving parallelizing.
>>
>> So I'd like you to give this a fair amount of testing before
>> pushing it.
> 
> OK, I am applying it to an experimental repo.  Let's give it a go:
> 
> 	$ time make -j32 2c 1c eb a4 nq sf sfnq
> 	[ . . . ]
> 	'perfbook-sf.pdf' is ready.
> 	'perfbook-1c.pdf' is ready.
> 	'perfbook.pdf' is ready.
> 	'perfbook-sfnq.pdf' is ready.
> 	'perfbook-a4.pdf' is ready.
> 	'perfbook-eb.pdf' is ready.
> 	'perfbook-nq.pdf' is ready.
> 
> 	real    2m31.412s
> 	user    16m45.778s
> 	sys     1m48.385s
> 
> Not bad, actually!  Might be worth redoing my release scripts to take
> advantage of this.  ;-)

Nice!

> 
> I (very) quickly glanced at the PDFs, and they look OK.
> 
> I then did a "make clean" and:
> 
> 	$ time make
> 	[ . . . ]
> 	'perfbook.pdf' is ready.
> 	utilities/punctcheck.sh
> 	utilities/cleverefcheck.sh
> 
> 	real    1m47.823s
> 	user    1m45.715s
> 	sys     0m1.226s
> 
> Another "make clean" and:
> 
> 	$ time make -j32
> 	[ . . . ]
> 	'perfbook.pdf' is ready.
> 	utilities/punctcheck.sh
> 	utilities/cleverefcheck.sh
> 
> 	real    1m49.484s
> 	user    1m47.206s
> 	sys     0m1.437s
> 
> So, as one would expect, the sweet spot for -j is when rebuilding
> all the images from scratch or when building multiple PDFs.
> 
> Nice!
> 
> Huh.  It would be good to have a way of diff-ing PDF files.  Then
> a single-threaded-generated PDF could be automatically compared to
> its counterpart from a concurrent build.  But the search engines
> were not kind to me.
> 
> Thoughts?

How about comparing .log files of two builds?

In my trial, "diff -u perfbook-single.log perfbook-multi.log"
yields only a hunk of build time difference as shown below:

    --- perfbook-single.log	2022-01-27 14:30:01.659959433 +0900

    +++ perfbook-multi.log	2022-01-27 14:33:57.556196036 +0900

    @@ -1,4 +1,4 @@

    -This is pdfTeX, Version 3.141592653-2.6-1.40.23 (TeX Live 2021) (preloaded format=pdflatex 2022.1.24)  27 JAN 2022 14:28

    +This is pdfTeX, Version 3.141592653-2.6-1.40.23 (TeX Live 2021) (preloaded format=pdflatex 2022.1.24)  27 JAN 2022 14:32

     entering extended mode

      restricted \write18 enabled.

      %&-line parsing enabled.


Not a direct comparison, but the log has a summary near the
end:

    Here is how much of TeX's memory you used:
     74049 strings out of 479599
     1597759 string characters out of 5876039
     1950680 words of memory out of 5000000
     80683 multiletter control sequences out of 15000+600000
     692091 words of font info for 721 fonts, out of 8000000 for 9000
     1816 hyphenation exceptions out of 8191
     105i,19n,133p,1187b,1660s stack positions out of 5000i,500n,10000p,200000b,80000s

     [long list of referenced font files]

    Output written on perfbook.pdf (638 pages, 8031215 bytes).
    PDF statistics:
     25510 PDF objects out of 26593 (max. 8388607)
     24061 compressed objects within 241 object streams
     7119 named destinations out of 7423 (max. 500000)
     166134 words of extra memory for PDF output out of 184870 (max. 10000000)

I think any visible difference in two PDFs is likely to be
reflected in this summary.

Indirect hints they may be, at least they provide partial
assurance.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>> --
>>  Makefile              | 6 +++---
>>  appendix/appendix.tex | 8 ++++----
>>  perfbook-lt.tex       | 4 ++--
>>  3 files changed, 9 insertions(+), 9 deletions(-)
>>
[...]
