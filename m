Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f54.google.com ([74.125.83.54]:36937 "EHLO
 mail-pg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752617AbdHBO5i (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 2
 Aug 2017 10:57:38 -0400
Received: by mail-pg0-f54.google.com with SMTP id y129so22184214pgy.4 for
 <perfbook@vger.kernel.org>; Wed, 02 Aug 2017 07:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=51Bul6diLkICF6tSMEon6i6JQK6frdluOPsGvjK88C8=;
 b=RmJgOEEcsUMX5OBxUQHDQy1M+MIb/0em6s8kESJBMY5iDYw/eTsYk/OHML3nW7sQiX
 dnXH+GDzddcVjHmzBOhe1Lam6caCNYKBms5LbyS6ptsQsDoKgxwTD5Zk17F7zpw29Q2U
 rDJC1Ch7wkF+qU7OE4b32htsaFTuv1Y38uYY+cJ4AH3mi+s/aZk4UVG+r+/7KD7/YVHH
 bkObTksxB/oGccrDWmgBzAoQu4l0F6RH3dvGZndzxe/Gp99XGx18UR2Hl0/5FjffrAZu
 pigO5dGGoXUNdhrXUUQYUC+mXCeczv7bFSCi1SDJONizDTIRIgDO4r2vlscALuf+x4ag
 Bofg==
Subject: Re: [PATCH v2 0/8] Add style guide
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
 <20170801204047.GH3730@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <068877e2-655b-0d6f-6dab-84d11467d0e5@gmail.com>
Date: Wed, 2 Aug 2017 23:57:33 +0900
MIME-Version: 1.0
In-Reply-To: <20170801204047.GH3730@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

On 2017/08/01 13:40:47 -0700, Paul E. McKenney wrote:
> On Mon, Jul 31, 2017 at 11:43:41PM +0900, Akira Yokosawa wrote:
>> >From e35b5bc0c56f255caee91054f05a5dd7b824b5fa Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Mon, 31 Jul 2017 23:20:57 +0900
>> Subject: [PATCH v2 0/8] Add style guide
>>
>> Hi Paul,
>>
>> This is the respin I mentioned earlier.
>> Patch #2 has a few more changes from v1 to modify strings of package name.
>> Other than that, the end result should be the same as v1.
> 
> Having a style guide is very good -- for one thing, it allows me to
> copy and paste from a uniform set of examples as opposed to whatever
> example happens to be at hand.  ;-)
> 
> So thank you very much!!!

Glad to know you like it!

> 
>> Note on the status of the floatrow package:
>>
>> Current version v0.3b was revised 2009/08/02.
>> There has been no update since.
>> I'm not sure if upstreaming is possible.
> 
> If we have to maintain our own, so it goes.
> 
> The missing two patches eventually showed up, so I applied them.
> 
> Some comments:
> 
> o	I have misgivings about thin spaces instead of commas for
> 	numbers.  I do understand the concern, given that many of our
> 	European readers are used to 1.234.567,89 instead of 1,234,567.89.
> 	My problem is that the NIST convention sounds like one of those
> 	compromises that makes things worse for everyone.
> 
> 	But let's see what I think in a year or two.

Maybe in another decade??? ;-)

> 
> o	I don't have an objection to the NIST percent convention.
> 	Let's face it, the percent character is a pain in LaTeX
> 	no matter what.  ;-)
> 
> o	I would definitely consider patches to improve the math.
> 
> o	I like the idea of autonumbering, but not if it requires
> 	the code being in separate files.

No, separate files are not required.
The LaTeX source of the code snippet cannot be embedded in \verbbox{}
because of the LaTeX commands therein, but \verbbox{} of C sources can
have the same option as the \verbfilebox{}.
By defining the option as a macro, it would be easier to convert to
auto-numbering scheme.

                                           Now, I have toyed with
> 	the idea of automatically extracting the code from the
> 	CodeSamples directory, but haven't yet come up with anything
> 	satisfactory.

Besides the adjustment of indentation, there need to be some way to
specify the part of the code you want to include as a code snippet.

> 
> 	The automation would probably make for more failures to
> 	update line-number references in the text, but then again
> 	that sometimes happens with the current arrangements.
> 
> o	I am not all that much a fan of captions at the tops of tables,
> 	but it is a very common convention, so I will accept patches
> 	converting tables to that format.

Position of captions can be specified in perfbook.tex for each type of float.
So it should be easy to choose a layout of your choice without any
modification of the source of tables, similar to the monospace font choice.

> 
> o	The ruled code (as in Listings D.3, D.4, and D.5) does look nice.
> 	Listing D.2 looks quite strange to me.  I would be happy to
> 	accept patches to make the listings look like Listing D.3.

Before such style adjustment, we need to convert those code snippets
to the "listings" environment. It will involve changes of label names and
its references, and the citing words "Figure" need to be changed to "Listing".

Those changes would be larger than the conversion from verbatim to verbbox.

> 
> o	In https://www.inf.ethz.ch/personal/markusp/teaching/guides/guide-tables.pdf,
> 	I find the examples from The Economist to be much more attractive
> 	than his example tables.  Not sure whether LaTeX is up to all
> 	that without excessive formatting pain, though.  ;-)
> 
> 	If it is easy to do, it would be interesting to see what
> 	Table D.2 would look like with The-Economist-style dashed
> 	lines between the rows.

There is a package named "arydshln". It provides dashed rules for tables.
But it conflicts with "tabulary" package. I'll see what I can.

> 
> o	Putting related code side by side as in Listings D.4 and D.5
> 	could be quite useful.  I did this manually in a few places,
> 	for example, Figures 9.38-9.40.  Maybe these would look better
> 	as floatrows.
> 
> And the comment at the end:
> 
> % Capitalize initialism:
> %    Gnu Compiler Collection = GCC
> %    gcc should be used as a command name in \co{gcc}
> %    When mentioning GCC's C language, use `GNU C'
> 
> I have been rather random here, and it would be good to have a
> standard.  The one above looks fine to me.
> 
> % Trademarks:
> %    As the Legal page covers trademarks, there is no need to
> %    use trademark symbol in the text. They seems to have been
> %    imported from original publications.
> 
> Indeed they have!
> 
> % Power or POWER?
> %    IBM's trademark page at https://www.ibm.com/legal/us/en/copytrade.shtml#section-P
> %    lists the following.
> %        PowerPC
> %        Power Architecture
> %        Power
> %        POWER
> %        POWER5
> %        POWER6
> %
> %    not Power5, POWER 5, nor Power-5
> 
> IBM's preferences have changed over time, so I end up importing
> whatever was the style at the time of publication.  :-/
> 
> Again, consistency would be good, but IBM's preferences are likely
> to continue to change over time.
> 
> What would you suggest?

What about defining a  macro named "\Power{}", which can be used like
\Power{5} in the source code? If IBM's preference changes, we can
change the definition accordingly.

> 
> % Ugly line break by \co{}
> %                                 __
> %        atomic_store()
> %
> %                           seqlock_
> %        t
> %
> %   Is there any way to prevent these breaks?
> %   Maybe we need an on-the-fly script to convert such \co{}s
> %   to couples of \co{}s.
> %   Example:
> %     \co{__atomic_store()} -> \co{__}\co{atomic_store()}
> %     \co{seqlock_t} ->        \co{seqlock_}\co{t}
> 
> As long as it is automated!  ;-)
> 
> Overall, my main goal here is making the book more attractive and
> easier to read -- not so much conventions for conventions sake.

Yes, I think I understand.

If I'm guessing right, you are in the middle of updating the memory
barriers section.
If the transition to auto-numbering helps in adding new code snippets,
I can generate an example patch of a (say) litmus test.

The other changes can wait after the upcoming release, I suppose.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>> --
>> Akira Yokosawa (8):
>>   Localize floatrow.sty as floatrowpf.sty
>>   Apply workaround to floatrowpf.sty
>>   Define 'listing' environment for style guide
>>   styleguide: Add listing environment examples
>>   Disable 'floatrow' layout in manually aligned code snippets
>>   styleguide: Add example of grouping code snippets
>>   styleguide: Add example of preferred table layout using 'booktabs'
>>   styleguide: Tweak layout of 'Limitation' table
>>
>>  appendix/styleguide/hello.c        |    9 +
>>  appendix/styleguide/styleguide.tex |  177 ++++-
>>  defer/rcuusage.tex                 |    6 +-
>>  floatrowpf.sty                     | 1482 ++++++++++++++++++++++++++++++++++++
>>  howto/howto.tex                    |    4 +-
>>  perfbook.tex                       |    4 +
>>  6 files changed, 1668 insertions(+), 14 deletions(-)
>>  create mode 100644 appendix/styleguide/hello.c
>>  create mode 100644 floatrowpf.sty
>>
>> -- 
>> 2.7.4
>>
>>
> 
> 

