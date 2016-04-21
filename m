Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e34.co.us.ibm.com ([32.97.110.152]:35759 "EHLO
 e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751761AbcDUQSN (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 21 Apr 2016
 12:18:13 -0400
Received: from localhost	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 21 Apr
 2016 10:18:12 -0600
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 D774D3E4003B	for <perfbook@vger.kernel.org>; Thu, 21 Apr 2016 10:18:09 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3LGI9Ke35061882	for <perfbook@vger.kernel.org>; Thu, 21 Apr 2016 16:18:09
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3LGI9dt003111	for <perfbook@vger.kernel.org>; Thu, 21 Apr 2016 12:18:09
 -0400
Date: Thu, 21 Apr 2016 09:18:40 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: perfbook patch
Message-ID: <20160421161840.GA3879@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <571883EE.4080103@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571883EE.4080103@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Balbir Singh <bsingharora@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Apr 21, 2016 at 05:40:30PM +1000, Balbir Singh wrote:
> Hey, Paul
> 
> perfbook failed to build on Fedora 23 due to a texlive issue. I am not sure if other users are facing it. In any case I came up with a patch -- update FAQ.txt with an answer. I was not sure if it is worth posting to perfbook mailing list
> 
> I'm attaching it - FYI. I hope its useful
> 
> Balbir

Hello, Balbir, and thank you!

I tried it on Ubuntu 14.04, and it works just fine there.  So are you
OK with the following hijacking of your original patch?

							Thanx, Paul

------------------------------------------------------------------------

commit 8c4c3c54d4d4246f6b13a914dda9c9ac42bf0c2e
Author: Balbir Singh <bsingharora@gmail.com>
Date:   Thu Apr 21 09:16:44 2016 -0700

    Fix build error on Fedora 23 with texlive
    
    The listings package is broken. The fix suggested is taken from
    http://osdir.com/ml/general/2014-06/msg50467.html
    
    Signed-off-by: Balbir Singh <bsingharora@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/perfbook.tex b/perfbook.tex
index ac46e74f6b6f..d607f66b428f 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -35,6 +35,18 @@
   literate={\_}{}{0\discretionary{\_}{}{\_}}%
 }
 %%HTMLNOSKIP
+\makeatletter
+\renewcommand\lstinline[1][]{%
+\leavevmode\bgroup % \hbox\bgroup --> \bgroup
+\def\lst@boxpos{b}%
+\lsthk@PreSet\lstset{flexiblecolumns,#1}%
+\lsthk@TextStyle
+\ifnum\iffalse{\fi`}=\z@\fi
+\@ifnextchar\bgroup{%
+\ifnum`{=\z@}\fi%
+\afterassignment\lst@InlineG \let\@let@token}{%
+\ifnum`{=\z@}\fi\lstinline@}}
+\makeatother
 \newcommand{\co}[1]{\lstinline[breaklines=yes,breakatwhitespace=yes]{#1}}

 \title{Is Parallel Programming Hard, And, If So, What Can You Do About It?}

