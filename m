Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50867 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1751382AbcFIXDw (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Thu, 9 Jun 2016 19:03:52 -0400
Received: from pps.filterd (m0075420.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u59N3iDl002066
 for <perfbook@vger.kernel.org>; Thu, 9 Jun 2016 19:03:51 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 23fcme65j5-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Thu,
 09 Jun 2016 19:03:51 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 9 Jun 2016
 19:03:50 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 0DD086E8040
 for <perfbook@vger.kernel.org>; Thu, 9 Jun 2016 19:03:32 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u59N3nj836110558	for <perfbook@vger.kernel.org>; Thu, 9 Jun 2016 23:03:49 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u59N3ndE012152	for <perfbook@vger.kernel.org>; Thu, 9 Jun 2016 19:03:49 -0400
Date: Thu, 9 Jun 2016 16:03:53 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] cpu: Align numbers at decimal points in tables
Reply-To: paulmck@linux.vnet.ibm.com
References: <5bed2a7b-7390-7aed-b91f-b83fb799bddc@gmail.com>
 <20160609163022.GE3758@linux.vnet.ibm.com>
 <5b6b6cbe-3549-10f3-e6f8-c7d1ac2f95a6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b6b6cbe-3549-10f3-e6f8-c7d1ac2f95a6@gmail.com>
Message-Id: <20160609230353.GJ3758@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jun 10, 2016 at 07:16:12AM +0900, Akira Yokosawa wrote:
> On 2016/06/10 1:30, Paul E. McKenney wrote:
> > On Fri, Jun 10, 2016 at 12:19:33AM +0900, Akira Yokosawa wrote:
> >> >From 5e22d5cb28e5db204c95386ea4427bacc985a7c9 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Fri, 10 Jun 2016 00:02:59 +0900
> >> Subject: [PATCH] cpu: Align numbers at decimal points in tables
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >> ---
> >>  cpu/overheads.tex | 56 +++++++++++++++++++++++++++++--------------------------
> >>  1 file changed, 30 insertions(+), 26 deletions(-)
> >>
> >> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> >> index 82853a8..2c89830 100644
> >> --- a/cpu/overheads.tex
> >> +++ b/cpu/overheads.tex
> >> @@ -111,24 +111,26 @@ This simplified sequence is just the beginning of a discipline called
> >>
> >>  \begin{table}
> >>  \centering
> >> -\begin{tabular}{l||r|r}
> >> -				& 	 	& Ratio \\
> >> -	Operation		& Cost (ns) 	& (cost/clock) \\
> >> +\begin{tabular}{l||r@{.}l|r@{.}l}
> >> +				& \multicolumn{2}{r}{} & \multicolumn{2}{r}{Ratio} \\
> >> +	Operation		& \multicolumn{2}{r}{Cost (ns)}	& \multicolumn{2}{r}{(cost/clock)} \\
> >>  	\hline
> >>  	\hline
> >> -	Clock period		&           0.6	&           1.0 \\
> >> +	Clock period		&           0 & 6 &         1 & 0 \\
> >>  	\hline
> >> -	Best-case CAS		&          37.9	&          63.2 \\
> >> +	Best-case CAS		&          37 & 9 &        63 & 2 \\
> >>  	\hline
> >> -	Best-case lock		&          65.6	&         109.3 \\
> >> +	Best-case lock		&          65 & 6 &       109 & 3 \\
> >>  	\hline
> >> -	Single cache miss	&         139.5	&         232.5 \\
> >> +	Single cache miss	&         139 & 5 &       232 & 5 \\
> >>  	\hline
> >> -	CAS cache miss		&         306.0	&         510.0 \\
> >> +	CAS cache miss		&         306 & 0 &       510 & 0 \\
> >>  	\hline
> >> -	Comms Fabric		&       3,000	&       5,000 \\
> >> +	Comms Fabric		& \multicolumn{1}{r@{ }}{3,000} & &
> >> +	\multicolumn{1}{r@{ }}{5,000} & \\
> >>  	\hline
> >> -	Global Comms		& 130,000,000	& 216,000,000 \\
> >> +	Global Comms		& \multicolumn{1}{r@{ }}{130,000,000} & &
> >> +	\multicolumn{1}{r@{ }}{216,000,000} & \\
> >>  \end{tabular}
> >>  \caption{Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
> >>  \label{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
> >> @@ -193,36 +195,38 @@ global agreement.
> >>
> >>  \begin{table}
> >>  \centering
> >> -\begin{tabular}{l||r|r}
> >> -				& 	 	& Ratio \\
> >> -	Operation		& Cost (ns) 	& (cost/clock) \\
> >> +\begin{tabular}{l||r@{.}l|r@{.}l}
> >> +				& \multicolumn{2}{r}{} & \multicolumn{2}{r}{Ratio} \\
> >> +	Operation		& \multicolumn{2}{r}{Cost (ns)} & \multicolumn{2}{r}{(cost/clock)} \\
> >>  	\hline
> >>  	\hline
> >> -	Clock period		&           0.4	&           1.0 \\
> >> +	Clock period		&           0 & 4 &         1 & 0 \\
> >>  	\hline
> >> -	``Best-case'' CAS	&          12.2	&          33.8 \\
> >> +	``Best-case'' CAS	&          12 & 2 &        33 & 8 \\
> >>  	\hline
> >> -	Best-case lock		&          25.6	&          71.2 \\
> >> +	Best-case lock		&          25 & 6 &        71 & 2 \\
> >>  	\hline
> >> -	Single cache miss	&          12.9	&          35.8 \\
> >> +	Single cache miss	&          12 & 9 &        35 & 8 \\
> >>  	\hline
> >> -	CAS cache miss		&           7.0	&          19.4 \\
> >> +	CAS cache miss		&           7 & 0 &        19 & 4 \\
> >>  	\hline
> >> -	Off-Core		&		&		\\
> >> +	Off-Core		& \multicolumn{1}{r@{ }}{} & & \multicolumn{1}{r@{ }}{} & \\
> >>  	\hline
> >> -	Single cache miss	&          31.2	&          86.6 \\
> >> +	Single cache miss	&          31 & 2 &        86 & 6 \\
> >>  	\hline
> >> -	CAS cache miss		&          31.2	&          86.5 \\
> >> +	CAS cache miss		&          31 & 2 &        86 & 5 \\
> >>  	\hline
> >> -	Off-Socket		&		&		\\
> >> +	Off-Socket		& \multicolumn{1}{r@{ }}{} & & \multicolumn{1}{r@{ }}{} & \\
> >>  	\hline
> >> -	Single cache miss	&          92.4	&         256.7 \\
> >> +	Single cache miss	&          92 & 4 &       256 & 7 \\
> >>  	\hline
> >> -	CAS cache miss		&          95.9	&         266.4 \\
> >> +	CAS cache miss		&          95 & 9 &       266 & 4 \\
> >>  	\hline
> >> -	Comms Fabric		&       4,500	&       7,500 \\
> >> +	Comms Fabric		& \multicolumn{1}{r@{ }}{4,500}	& &
> >> +	\multicolumn{1}{r@{ }}{7,500} & \\
> >>  	\hline
> >> -	Global Comms		& 195,000,000	& 324,000,000 \\
> >> +	Global Comms		& \multicolumn{1}{r@{ }}{195,000,000} & &
> >> +	\multicolumn{1}{r@{ }}{324,000,000} & \\
> >>  \end{tabular}
> >>  \caption{Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
> >>  \label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
> > 
> > How about the following instead, to get rid of the decimal point as well?
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> > index 82853a8e1832..7d33c4800edb 100644
> > --- a/cpu/overheads.tex
> > +++ b/cpu/overheads.tex
> > @@ -126,9 +126,13 @@ This simplified sequence is just the beginning of a discipline called
> >  	\hline
> >  	CAS cache miss		&         306.0	&         510.0 \\
> >  	\hline
> > -	Comms Fabric		&       3,000	&       5,000 \\
> > +	Comms Fabric		&       3,000\textcolor{white}{.0}
> > +						&       5,000\textcolor{white}{.0}
> > +								\\
> >  	\hline
> > -	Global Comms		& 130,000,000	& 216,000,000 \\
> > +	Global Comms		& 130,000,000\textcolor{white}{.0}
> > +						& 216,000,000\textcolor{white}{.0}
> > +								\\
> >  \end{tabular}
> >  \caption{Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
> >  \label{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
> > diff --git a/perfbook.tex b/perfbook.tex
> > index 938c5ee3fd46..5c74adb204af 100644
> > --- a/perfbook.tex
> > +++ b/perfbook.tex
> > @@ -17,6 +17,7 @@
> >  \usepackage{graphicx}
> >  \usepackage{enumerate}
> >  \usepackage{ifthen}
> > +\usepackage{xcolor}
> >  \usepackage{listings}
> >  \lstset{basicstyle=\ttfamily}
> >  % \usepackage[strings]{underscore}
> > 
> > 
> 
> Ah, this is way simpler and easy to maintain.
> 
> Feel free to add
> 
> Reported-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Or do you want me to resend a revised patch?

I committed with your Reported-by an pushed it, so we are set.

							Thanx, Paul

