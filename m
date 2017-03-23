Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60789 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751619AbdCWPgD (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 23
 Mar 2017 11:36:03 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v2NFSZ6n054402
 for <perfbook@vger.kernel.org>; Thu, 23 Mar 2017 11:36:02 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 29c57ednk4-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 23 Mar 2017 11:36:01 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 23 Mar
 2017 11:36:00 -0400
Date: Thu, 23 Mar 2017 08:35:58 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] FAQ-BUILD.txt: Append reference to manual LaTeX package
 install
Reply-To: paulmck@linux.vnet.ibm.com
References: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
Message-Id: <20170323153558.GD3637@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Mar 23, 2017 at 10:03:29PM +0900, Akira Yokosawa wrote:
> >From 4452298c139d3af3abb5af1d1a3a40754851e0b6 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 23 Mar 2017 21:47:58 +0900
> Subject: [PATCH] FAQ-BUILD.txt: Append reference to manual LaTeX package install
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> So, this is the update of FAQ-BUILD.txt.
> Feel free to wordsmith as you like before pushing out.

I pushed the following, please let me know if my wordsmithing smithed
meaning out of existence so I can fix.

							Thanx, Paul

------------------------------------------------------------------------

commit 39ce24a30848c96064f9ff0c61f1d883c2baf8e0
Author: Akira Yokosawa <akiyks@gmail.com>
Date:   Thu Mar 23 21:47:58 2017 +0900

    FAQ-BUILD.txt: Append reference to manual LaTeX package install
    
    Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
    [ paulmck: Wordsmithing. ]

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 6627bbbe2d6f..c772e8fdcef0 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -34,7 +34,7 @@
 	find it?

 	A.	The "pdflatex" package is a variant of Don Knuth's
-		digital typesetting program.  On Ubuntu Trusty,
+		digital typesetting program.  On Ubuntu Trusty and Xenial,
 		installing the following set of packages suffices:

 			texlive-latex-base texlive-latex-extra psutils
@@ -83,3 +83,36 @@
 		so if it happens, please let me know.  Please send me the
 		perfbook.log output (or perfbook-1c.log output, depending
 		on which you were building) so that I can fix the scripts.
+
+8.	Some of experimental targets for alternative font won't build
+	due to lack of necessary packages such as "newtxtt". How can I
+	install those packages?
+
+	A.	The simplest approach is to upgrade to a recent TeX
+		distribution such as TeX Live 2016.  Upgrading your Linux
+		distribution (e.g. to Ubuntu Xenial) is one way to
+		upgrade to TeX Live 2016, and might have many other
+		benefits as well.
+
+		However, if you prefer to manually install individual
+		packages, refer to "Method 3" in:
+
+			http://tex.stackexchange.com/questions/73016/
+
+		For font packages such as "newtxtt" and "nimbus15",
+		you must also update font-map database. See:
+
+			http://tex.stackexchange.com/questions/88423/
+
+		Note: If available, you can use the <package>.tds.zip,
+		which will automatically put the files in the right place.
+		Note that font packages should be copied to the TEXMFLOCAL
+		directory rather than to the TEXFMHOME directory.
+
+		Following is a list of links to optional packages as of
+		March 2017:
+
+			https://www.ctan.org/pkg/newtxtt
+			https://www.ctan.org/pkg/nimbus15
+			https://www.ctan.org/pkg/inconsolata
+			https://www.ctan.org/pkg/mathastext

