Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e23smtp04.au.ibm.com ([202.81.31.146]:51877 "EHLO
 e23smtp04.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP
 id S1750990AbbJAGqD (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 1 Oct
 2015 02:46:03 -0400
Received: from /spool/local	by e23smtp04.au.ibm.com with IBM ESMTP SMTP
 Gateway: Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;	Thu, 1 Oct
 2015 16:46:00 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])	by
 d23dlp02.au.ibm.com (Postfix) with ESMTP id 201112BB004D	for
 <perfbook@vger.kernel.org>; Thu, 1 Oct 2015 16:45:58 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])	by
 d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t916jpX241287854	for <perfbook@vger.kernel.org>; Thu, 1 Oct 2015 16:45:59
 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])	by
 d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t916jPck030741	for <perfbook@vger.kernel.org>; Thu, 1 Oct 2015 16:45:25 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])	by
 d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 t916jODu029911	for <perfbook@vger.kernel.org>; Thu, 1 Oct 2015 16:45:25 +1000
Received: from ajd.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])	by
 ozlabs.au.ibm.com (Postfix) with ESMTP id BFBFFA028C	for
 <perfbook@vger.kernel.org>; Thu, 1 Oct 2015 16:44:59 +1000 (AEST)
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Subject: [PATCH] Fix capitalisation of "Figure" in credits for real-time
 chapter
Date: Thu,  1 Oct 2015 16:45:16 +1000
Message-Id: <1443681916-394-1-git-send-email-andrew.donnellan@au1.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
---
 contrib.tex | 16 ++++++++--------
 rt/rt.tex   | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/contrib.tex b/contrib.tex
index 14cc20e..11bcdb3 100644
--- a/contrib.tex
+++ b/contrib.tex
@@ -37,14 +37,14 @@
 \ContribItem{Figure}{fig:advsync:Speculative Loads Cancelled by Barrier}{David Howells}
 \ContribItem{Figure}{fig:advsync:Memory Architecture}{David Howells}
 \ContribItem{Figure}{fig:advsync:Split Caches}{David Howells}
-\ContribItem{figure}{fig:rt:Hard Real-Time Response Guarantee, Meet Hammer}{Melissa Broussard}
-\ContribItem{figure}{fig:rt:Real-Time Response: Hardware Matters}{Melissa Broussard}
-\ContribItem{figure}{fig:rt:Real-Time Response: Notification Insufficient}{Melissa Broussard}
-\ContribItem{figure}{fig:rt:Timer Wheel at 1kHz}{Melissa Broussard}
-\ContribItem{figure}{fig:rt:Timer Wheel at 100kHz}{Melissa Broussard}
-\ContribItem{figure}{fig:rt:Priority Inversion and User Input}{Melissa Broussard}
-\ContribItem{figure}{fig:rt:The Dark Side of Real-Time Computing}{Sarah McKenney}
-\ContribItem{figure}{fig:rt:The Dark Side of Real-Fast Computing}{Sarah McKenney}
+\ContribItem{Figure}{fig:rt:Hard Real-Time Response Guarantee, Meet Hammer}{Melissa Broussard}
+\ContribItem{Figure}{fig:rt:Real-Time Response: Hardware Matters}{Melissa Broussard}
+\ContribItem{Figure}{fig:rt:Real-Time Response: Notification Insufficient}{Melissa Broussard}
+\ContribItem{Figure}{fig:rt:Timer Wheel at 1kHz}{Melissa Broussard}
+\ContribItem{Figure}{fig:rt:Timer Wheel at 100kHz}{Melissa Broussard}
+\ContribItem{Figure}{fig:rt:Priority Inversion and User Input}{Melissa Broussard}
+\ContribItem{Figure}{fig:rt:The Dark Side of Real-Time Computing}{Sarah McKenney}
+\ContribItem{Figure}{fig:rt:The Dark Side of Real-Fast Computing}{Sarah McKenney}
 \ContribItem{Figure}{fig:easy:Shaving the Mandelbrot Set}{Melissa Broussard}
 \ContribItem{Figure}{fig:future:Uniprocessor Uber Alles}{Melissa Broussard}
 \ContribItem{Figure}{fig:future:Multithreaded Mania}{Melissa Broussard}
diff --git a/rt/rt.tex b/rt/rt.tex
index 12a75ca..efd1d9d 100644
--- a/rt/rt.tex
+++ b/rt/rt.tex
@@ -75,7 +75,7 @@ some measure of exactly how soft it is.
 \resizebox{3in}{!}{\includegraphics{cartoons/realtime-smash}}
 \end{center}
 \caption{Real-Time Response Guarantee, Meet Hammer}
-\ContributedBy{figure}{fig:rt:Hard Real-Time Response Guarantee, Meet Hammer}{Melissa Broussard}
+\ContributedBy{Figure}{fig:rt:Hard Real-Time Response Guarantee, Meet Hammer}{Melissa Broussard}
 \end{figure}

 In contrast, the definition of hard real time is quite definite.
@@ -94,7 +94,7 @@ But it is also true that I can always get a bigger hammer.
 \resizebox{3in}{!}{\includegraphics{cartoons/realtime-lifesupport-nobomb}}
 \end{center}
 \caption{Real-Time Response: Hardware Matters}
-\ContributedBy{figure}{fig:rt:Real-Time Response: Hardware Matters}{Melissa Broussard}
+\ContributedBy{Figure}{fig:rt:Real-Time Response: Hardware Matters}{Melissa Broussard}
 \end{figure}

 Then again, perhaps it is unfair to blame the software for what is clearly
@@ -125,7 +125,7 @@ it can alert the hospital staff.
 \resizebox{6in}{!}{\rotatebox{90}{\includegraphics{cartoons/realtime-lazy-crop}}}
 \end{center}
 \caption{Real-Time Response: Notification Insufficient}
-\ContributedBy{figure}{fig:rt:Real-Time Response: Notification Insufficient}{Melissa Broussard}
+\ContributedBy{Figure}{fig:rt:Real-Time Response: Notification Insufficient}{Melissa Broussard}
 \end{figure*}

 Unfortunately, this approach has the trivial solution fancifully depicted in
@@ -892,7 +892,7 @@ levels.
 \resizebox{3.0in}{!}{\includegraphics{cartoons/1kHz}}
 \end{center}
 \caption{Timer Wheel at 1kHz}
-\ContributedBy{figure}{fig:rt:Timer Wheel at 1kHz}{Melissa Broussard}
+\ContributedBy{Figure}{fig:rt:Timer Wheel at 1kHz}{Melissa Broussard}
 \end{figure}

 \begin{figure}[tb]
@@ -900,7 +900,7 @@ levels.
 \resizebox{3.0in}{!}{\includegraphics{cartoons/100kHz}}
 \end{center}
 \caption{Timer Wheel at 100kHz}
-\ContributedBy{figure}{fig:rt:Timer Wheel at 100kHz}{Melissa Broussard}
+\ContributedBy{Figure}{fig:rt:Timer Wheel at 100kHz}{Melissa Broussard}
 \end{figure}

 Unfortunately, timer wheels do not work well for real-time systems, and for
@@ -1046,7 +1046,7 @@ priority inversion.
 \resizebox{3.4in}{!}{\includegraphics{cartoons/Priority_Boost_2}}
 \end{center}
 \caption{Priority Inversion and User Input}
-\ContributedBy{figure}{fig:rt:Priority Inversion and User Input}{Melissa Broussard}
+\ContributedBy{Figure}{fig:rt:Priority Inversion and User Input}{Melissa Broussard}
 \end{figure}

 Of course, priority inheritance does have its limitations.
@@ -1760,7 +1760,7 @@ unforgiving.
 \resizebox{3.2in}{!}{\includegraphics{cartoons/RealTimeNotRealFast}}
 \end{center}
 \caption{The Dark Side of Real-Time Computing}
-\ContributedBy{figure}{fig:rt:The Dark Side of Real-Time Computing}{Sarah McKenney}
+\ContributedBy{Figure}{fig:rt:The Dark Side of Real-Time Computing}{Sarah McKenney}
 \end{figure}

 \begin{figure}[tb]
@@ -1768,7 +1768,7 @@ unforgiving.
 \resizebox{3.2in}{!}{\includegraphics{cartoons/RealFastNotRealTime}}
 \end{center}
 \caption{The Dark Side of Real-Fast Computing}
-\ContributedBy{figure}{fig:rt:The Dark Side of Real-Fast Computing}{Sarah McKenney}
+\ContributedBy{Figure}{fig:rt:The Dark Side of Real-Fast Computing}{Sarah McKenney}
 \end{figure}

 The choice between real-time and real-fast computing can be a difficult one.
-- 
Andrew Donnellan              Software Engineer, OzLabs
andrew.donnellan@au1.ibm.com  Australia Development Lab, Canberra
+61 2 6201 8874 (work)        IBM Australia Limited

