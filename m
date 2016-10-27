Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36357 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1753974AbcJ0QBF (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 27
 Oct 2016 12:01:05 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u9RFxSqW110244
 for <perfbook@vger.kernel.org>; Thu, 27 Oct 2016 12:01:00 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 26bkh1p8ms-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 27 Oct 2016 12:01:00 -0400
Received: from localhost by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 27 Oct
 2016 10:00:59 -0600
Date: Thu, 27 Oct 2016 09:01:01 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [Q] url in bibliography
Reply-To: paulmck@linux.vnet.ibm.com
References: <8d8bb422-0d2c-f905-4f72-bafe6d702af5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d8bb422-0d2c-f905-4f72-bafe6d702af5@gmail.com>
Message-Id: <20161027160101.GL3716@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Oct 28, 2016 at 12:19:36AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I have a question regarding your commit 29650119a215 ("Update bibliography").
> 
> In the 1st hunk,
> 
> > +@unpublished{PaulEMcKennneyToolKitP0232R0
> > +,Author="Paul E. McKenney and Michael Wong and Maged Michael"
> > +,Title="P0232R0: A Concurrency ToolKit for Structured Deferral or Optimistic
> > +Speculation"
> > +,month="February"
> > +,day="12"
> > +,year="2016"
> > +,note="\url{http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0232r0.pdf}"
> > +}
> 
> you chose the format 'note="\url{http://...}"'.
> 
> In the 2nd hunk,
> 
> > +@unpublished{HansBoehm2012seqlockC11
> > +,author="Hans-J. Boehm"
> > +,title="Can Seqlocks Get Along With Programming Language Memory Models?"
> > +,Year="2012"
> > +,Month="June"
> > +,Day="6"
> > +,Note="HPL-2012-68"
> > +,url={http://www.hpl.hp.com/techreports/2012/HPL-2012-68.pdf}
> > +}
> > +
> 
> you chose the format 'url={http://...}'.
> 
> There are other format such as 'note="Available \url{http://...}
> [Viewed Month Day, Year]"' in the other part of bibliography.
> 
> I'm wondering what is the rule which format to choose in expressing urls.
> Could you enlighten me?

It has varied over time.  :-/

I have been using LaTeX and accumulating .bib entries since before "url="
and "\url" existed, in fact since before the web existed.  The "Available"
syntax was required for my Ph.D. dissertation, but I have been backing
away from it because it is ugly and takes up a lot of space.

So, what would you suggest?  ;-)

One constraint...  The "unpublished" entries must have a "note" field,
so the ",note=\url{" form seems necessary in those cases, at least
when there is no technical report number or some such.  In most other
types of bib entries, it is quite possible that "url=" look better.

One thing to keep in mind, also.  The .bib files in perfbook are copies
of a master .bib git tree that I keep privately, in part because I
never dreamed back in 1987 that I would ever be making the comments in
the .bib files public, and I never have gotten time to clean them up.
Plus some of the not-for-public-consumption comments are quite useful,
so I don't want to delete them.  And yes, the oldest bib entries really
were collected the old-fashioned way, by going to a physical library,
holding a physical book/magazine/journal/whatever, writing the information
down on paper, then going back to my desk and typing it all into my
terminal.  Which in some cases would have been a 24x80 dumb terminal
(like a VT100), but in other cases might have been an X terminal,
a Sun workstation, or, later, a PC running X.

So my normal process requires me to apply the patches twice, often by
hand to the private git tree.  Which is fine normally, but might need
some help for a mass-change patch set.  For example, perhaps a script.

Suggestions?

							Thanx, Paul

