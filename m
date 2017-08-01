Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42292 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752122AbdHAUku (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 1
 Aug 2017 16:40:50 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v71KcvQR075386
 for <perfbook@vger.kernel.org>; Tue, 1 Aug 2017 16:40:50 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2c2v206ds2-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 01 Aug 2017 16:40:50 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 1 Aug 2017
 16:40:49 -0400
Date: Tue, 1 Aug 2017 13:40:47 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/8] Add style guide
Reply-To: paulmck@linux.vnet.ibm.com
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
Message-Id: <20170801204047.GH3730@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jul 31, 2017 at 11:43:41PM +0900, Akira Yokosawa wrote:
> >From e35b5bc0c56f255caee91054f05a5dd7b824b5fa Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 31 Jul 2017 23:20:57 +0900
> Subject: [PATCH v2 0/8] Add style guide
> 
> Hi Paul,
> 
> This is the respin I mentioned earlier.
> Patch #2 has a few more changes from v1 to modify strings of package name.
> Other than that, the end result should be the same as v1.

Having a style guide is very good -- for one thing, it allows me to
copy and paste from a uniform set of examples as opposed to whatever
example happens to be at hand.  ;-)

So thank you very much!!!

> Note on the status of the floatrow package:
> 
> Current version v0.3b was revised 2009/08/02.
> There has been no update since.
> I'm not sure if upstreaming is possible.

If we have to maintain our own, so it goes.

The missing two patches eventually showed up, so I applied them.

Some comments:

o	I have misgivings about thin spaces instead of commas for
	numbers.  I do understand the concern, given that many of our
	European readers are used to 1.234.567,89 instead of 1,234,567.89.
	My problem is that the NIST convention sounds like one of those
	compromises that makes things worse for everyone.

	But let's see what I think in a year or two.

o	I don't have an objection to the NIST percent convention.
	Let's face it, the percent character is a pain in LaTeX
	no matter what.  ;-)

o	I would definitely consider patches to improve the math.

o	I like the idea of autonumbering, but not if it requires
	the code being in separate files.  Now, I have toyed with
	the idea of automatically extracting the code from the
	CodeSamples directory, but haven't yet come up with anything
	satisfactory.

	The automation would probably make for more failures to
	update line-number references in the text, but then again
	that sometimes happens with the current arrangements.

o	I am not all that much a fan of captions at the tops of tables,
	but it is a very common convention, so I will accept patches
	converting tables to that format.

o	The ruled code (as in Listings D.3, D.4, and D.5) does look nice.
	Listing D.2 looks quite strange to me.  I would be happy to
	accept patches to make the listings look like Listing D.3.

o	In https://www.inf.ethz.ch/personal/markusp/teaching/guides/guide-tables.pdf,
	I find the examples from The Economist to be much more attractive
	than his example tables.  Not sure whether LaTeX is up to all
	that without excessive formatting pain, though.  ;-)

	If it is easy to do, it would be interesting to see what
	Table D.2 would look like with The-Economist-style dashed
	lines between the rows.

o	Putting related code side by side as in Listings D.4 and D.5
	could be quite useful.  I did this manually in a few places,
	for example, Figures 9.38-9.40.  Maybe these would look better
	as floatrows.

And the comment at the end:

% Capitalize initialism:
%    Gnu Compiler Collection = GCC
%    gcc should be used as a command name in \co{gcc}
%    When mentioning GCC's C language, use `GNU C'

I have been rather random here, and it would be good to have a
standard.  The one above looks fine to me.

% Trademarks:
%    As the Legal page covers trademarks, there is no need to
%    use trademark symbol in the text. They seems to have been
%    imported from original publications.

Indeed they have!

% Power or POWER?
%    IBM's trademark page at https://www.ibm.com/legal/us/en/copytrade.shtml#section-P
%    lists the following.
%        PowerPC
%        Power Architecture
%        Power
%        POWER
%        POWER5
%        POWER6
%
%    not Power5, POWER 5, nor Power-5

IBM's preferences have changed over time, so I end up importing
whatever was the style at the time of publication.  :-/

Again, consistency would be good, but IBM's preferences are likely
to continue to change over time.

What would you suggest?

% Ugly line break by \co{}
%                                 __
%        atomic_store()
%
%                           seqlock_
%        t
%
%   Is there any way to prevent these breaks?
%   Maybe we need an on-the-fly script to convert such \co{}s
%   to couples of \co{}s.
%   Example:
%     \co{__atomic_store()} -> \co{__}\co{atomic_store()}
%     \co{seqlock_t} ->        \co{seqlock_}\co{t}

As long as it is automated!  ;-)

Overall, my main goal here is making the book more attractive and
easier to read -- not so much conventions for conventions sake.

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (8):
>   Localize floatrow.sty as floatrowpf.sty
>   Apply workaround to floatrowpf.sty
>   Define 'listing' environment for style guide
>   styleguide: Add listing environment examples
>   Disable 'floatrow' layout in manually aligned code snippets
>   styleguide: Add example of grouping code snippets
>   styleguide: Add example of preferred table layout using 'booktabs'
>   styleguide: Tweak layout of 'Limitation' table
> 
>  appendix/styleguide/hello.c        |    9 +
>  appendix/styleguide/styleguide.tex |  177 ++++-
>  defer/rcuusage.tex                 |    6 +-
>  floatrowpf.sty                     | 1482 ++++++++++++++++++++++++++++++++++++
>  howto/howto.tex                    |    4 +-
>  perfbook.tex                       |    4 +
>  6 files changed, 1668 insertions(+), 14 deletions(-)
>  create mode 100644 appendix/styleguide/hello.c
>  create mode 100644 floatrowpf.sty
> 
> -- 
> 2.7.4
> 
> 

