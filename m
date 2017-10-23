Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55524 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932143AbdJWRuA (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 23
 Oct 2017 13:50:00 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9NHnM8R103882
 for <perfbook@vger.kernel.org>; Mon, 23 Oct 2017 13:50:00 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dsj2tgtng-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 23 Oct 2017 13:50:00 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 23 Oct
 2017 13:49:59 -0400
Date: Mon, 23 Oct 2017 10:49:56 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Update table layout
Reply-To: paulmck@linux.vnet.ibm.com
References: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
 <20171023022430.GJ3659@linux.vnet.ibm.com>
 <67030f8b-7adc-602b-9d45-a619be702bf7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67030f8b-7adc-602b-9d45-a619be702bf7@gmail.com>
Message-Id: <20171023174955.GO3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 24, 2017 at 12:25:20AM +0900, Akira Yokosawa wrote:
> On 2017/10/22 19:24:30 -0700, Paul E. McKenney wrote:
> > On Mon, Oct 23, 2017 at 12:20:14AM +0900, Akira Yokosawa wrote:
> >> >From d224db4bfed5d4ce0639062a920bafc6f9442e16 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Sun, 22 Oct 2017 23:55:49 +0900
> >> Subject: [PATCH 0/5] Update table layout
> >>
> >> Hi Paul,
> >>
> >> My first idea was to add a make target for "table captions at the top".
> >> But I changed my mind and promoted the layout as default.
> >> Instead, I added a target "perfbook-tcb.pdf" (tcb: Table Caption Bottom),
> >> which keeps the caption at the bottom.
> >>
> >> Patch #1 does the change in perfbook.tex and Makefile.
> >>
> >> Patches #2 and #3 are minor fixes I noticed while updating tables.
> >>
> >> Patch #4 updates most tables to use the new table layout experimented in
> >> Style Guide for a while.  It contains changes to use "S" column specifier
> >> provided by the "siunitx" package.
> >>
> >> Patch #5 converts a table into a figure drawn by tabular.
> >>
> >> There remains several tables not yet touched. They are complex and large
> >> ones. They need extra work to use the new scheme.
> >>
> >> NOTE: Table 13.1 does not contain legends and does not use subscripts
> >> as shown in Table D.5 at the moment. In the text, it looks OK to me.
> >>
> >> Thoughts?
> > 
> > At a first scan, this all looks good.  There are a few remaining
> > tables in the old format, including a couple that we discussed earlier
> > as being quite complex.  Which should be fine, for the time being,
> > at least.  But what are your thoughts on the remaining old-style tables?
> 
> Tables 17.1 and 17.2 are hard ones. Alternate-row coloring scheme can not
> be applied for them. We need to figure out how to improve them. I'm fine with
> them to be left for the moment.

Works for me as well!

> Table 7.1 does not fit to the format because of the "Null (Not Held)" column.
> As all the cells of the column are all blank, vertical rules actually helps
> in this table. If you put some character/symbol to indicate compatibility,
> it can be converted to the new format. If you have a good candidate, please
> let me know.

Hmmm...  Is there a very light grey variant of the square that appears
at the end of each quick quiz?  "\rule{7pt}{7pt}}", if I am not getting
too confused.  Ah, there is.  Please see the crude experimental patch
below.  (As in if you do choose to do something like this, please make
a more sensible/maintainable version.)

> I'm sending patches to update Tables 9.3 and C.1, and a patch to convert
> Tables C.2, C.3, and C.4 into Listings.
> 
> If there is any table I'm missing, feel free to tell me.

I will try them out, thank you!

							Thanx, Paul
------------------------------------------------------------------------

diff --git a/locking/locking.tex b/locking/locking.tex
index 9cb01761cafb..08de61650ae5 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1311,6 +1311,8 @@ or even milliseconds.
 \subsection{Beyond Reader-Writer Locks}
 \label{sec:locking:Beyond Reader-Writer Locks}

+\newcommand{\x}{\textcolor{gray!20}{\rule{7pt}{7pt}}}
+
 \begin{table}
 \small
 \centering
@@ -1336,19 +1338,19 @@ or even milliseconds.
 	  \end{picture}
 	\\
 	\hline
-%				 NL  CR  CW  PR    PW  EX
+%				  NL   CR   CW     PR   PW   EX
 	\hline
-	Null (Not Held)		& ~ & ~ & ~   & ~ & ~ & ~ \\
+	Null (Not Held)		& \x & \x & \x   & \x & \x & \x \\
 	\hline
-	Concurrent Read		& ~ & ~ & ~   & ~ & ~ & X \\
+	Concurrent Read		& \x & \x & \x   & \x & \x &  X \\
 	\hline
-	Concurrent Write	& ~ & ~ & ~   & X & X & X \\
+	Concurrent Write	& \x & \x & \x   &  X &  X &  X \\
 	\hline
-	Protected Read		& ~ & ~ & X   & ~ & X & X \\
+	Protected Read		& \x & \x &  X   & \x &  X &  X \\
 	\hline
-	Protected Write		& ~ & ~ & X   & X & X & X \\
+	Protected Write		& \x & \x &  X   &  X &  X &  X \\
 	\hline
-	Exclusive		& ~ & X & X   & X & X & X \\
+	Exclusive		& \x &  X &  X   &  X &  X &  X \\
 \end{tabular}
 \caption{VAX/VMS Distributed Lock Manager Policy}
 \label{tab:locking:VAX/VMS Distributed Lock Manager Policy}

