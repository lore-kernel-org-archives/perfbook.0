Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:55573 "EHLO
 out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org
 with ESMTP id S1753350AbbCRAaX (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Tue, 17 Mar 2015 20:30:23 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])	by
 mailout.nyi.internal (Postfix) with ESMTP id B2C0D20C78	for
 <perfbook@vger.kernel.org>; Tue, 17 Mar 2015 20:30:20 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=
 x-sasl-enc:from:to:cc:subject:date:message-id; s=mesmtp; bh=++DI
 ObCaTcugqEWEtqtns1jqV5Y=; b=TgmNYeI7b+3gqiBZJwruxLoYAwVM/P1hs9ra
 xTjtjwJa6NW6suIkOl3AQ6GTj/1VWaiOALMUCrYAG27D1txWREFKtvT6me99Xwva
 +ytrRbxZGYxRCw07McDoX6ANfLL2fDPEdU0vVo/TCuFIW0a5VMMPyLmVRDVikARn	Vgovtfk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=	messagingengine.com;
 h=x-sasl-enc:from:to:cc:subject:date	:message-id; s=smtpout;
 bh=++DIObCaTcugqEWEtqtns1jqV5Y=; b=Mh8BO
 pgXCIWRXw7wPKUO7hFjZ9cqHIK3j+8TznzfiEymLZTsAbSyPC0NFg31DUKyy9zxh
 fWFcWVypl7Mbt+oWwvJ1GNscq8xuKCLZF4OvrcPhX6VaZQNGfb3nE01LjHgW23OI
 3hEa+fxwwbOs1gHq1aouUpbV+untjx+5bTwPG4=
From: "Emilio G. Cota" <cota@braap.org>
Subject: [PATCH] advsync/mb: fix wrong value of B in data dep example
Date: Tue, 17 Mar 2015 20:30:22 -0400
Message-Id: <1426638622-8901-1-git-send-email-cota@braap.org>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index e512785..cc11323 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1667,65 +1667,65 @@ To deal with this, a data dependency barrier must be inserted between the
 address load and the data load (again with initial values of
 {\tt \{A = 1, B = 2, C = 3, P = \&A, Q = \&C\}}):

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
 	CPU 1 &		CPU 2 \\
 	\hline
 	B = 4; & \\
 	<write barrier> & \\
 	P = \&B; &	\\
 		&	Q = P; \\
 		&	<data dependency barrier> \\
 		&	D = *Q; \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}

 This enforces the occurrence of one of the two implications, and prevents the
 third possibility from arising.

 Note that this extremely counterintuitive situation arises most easily on
 machines with split caches, so that, for example, one cache bank processes
 even-numbered cache lines and the other bank processes odd-numbered cache
 lines.
 The pointer \co{P} might be stored in an odd-numbered cache line, and the
 variable \co{B} might be stored in an even-numbered cache line.  Then, if the
 even-numbered bank of the reading CPU's cache is extremely busy while the
 odd-numbered bank is idle, one can see the new value of the
 pointer \co{P} (which is \co{&B}),
-but the old value of the variable \co{B} (which is 1).
+but the old value of the variable \co{B} (which is 2).

 Another example of where data dependency barriers might by required is where a
 number is read from memory and then used to calculate the index for an array
 access with initial values
 {\tt \{M[0] = 1, M[1] = 2, M[3] = 3, P = 0, Q = 3\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \tt
 \scriptsize
 \begin{tabular}{l|p{1.5in}}
 	CPU 1 &		CPU 2 \\
 	\hline
 	M[1] = 4; & \\
 	<write barrier> & \\
 	P = 1;	&	\\
 		&	Q = P; \\
 		&	<data dependency barrier> \\
 		&	D = M[Q]; \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}

 The data dependency barrier is very important to the Linux kernel's
 RCU system, for example,
 see \co{rcu_dereference()} in \url{include/linux/rcupdate.h}.
 This permits the current
 target of an RCU'd pointer to be replaced with a new modified target, without
 the replacement target appearing to be incompletely initialised.

 See also
 Section~\ref{sec:advsync:Cache Coherency}
-- 
1.9.1

