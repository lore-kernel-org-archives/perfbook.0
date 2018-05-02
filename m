Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34068 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751451AbeEBPMA (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 2
 May 2018 11:12:00 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w42FA9MU134848
 for <perfbook@vger.kernel.org>; Wed, 2 May 2018 11:11:59 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2hqf1c2cnn-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Wed, 02 May 2018 11:11:59 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 2 May 2018
 11:11:57 -0400
Date: Wed, 2 May 2018 08:13:15 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Misc updates in Makefile and FAQ-BUILD.txt
Reply-To: paulmck@linux.vnet.ibm.com
References: <cf0ba9bc-ba0e-fac5-4b1d-52a69655244d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf0ba9bc-ba0e-fac5-4b1d-52a69655244d@gmail.com>
Message-Id: <20180502151315.GZ26088@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, May 02, 2018 at 01:14:24PM +0900, Akira Yokosawa wrote:
> >From 9a745e15ae38e8cfc329a365f2ff28112a19a5c3 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 2 May 2018 12:31:27 +0900
> Subject: [PATCH 0/5] Misc updates in Makefile and FAQ-BUILD.txt
> 
> Hi Paul,
> 
> This patch set is the result of trying Ubuntu Bionic to build
> perfbook.
> 
> One major issue is the incompatibility of a2ping 2.77p and
> Ghostscript 9.22. You need a2ping 2.83p which is upstream at
> https://www.ctan.org/pkg/a2ping.
> 
> a2ping is basically a perl script, so you can easily use the latest
> one by putting it in your local bin directory.
> 
> Other changes in this set are fixes and modifications I made while
> testing on Ubuntu Bionic. The updated Makefile is tested on
> Ubuntu Trusty, Ubuntu Xenial, Ubuntu Bionic, Fedora 26, and Fedora 27.
> 
> Patch #1 updates message of "make help".
> Patch #2 adds entry on a2ping compatibility issue in FAQ-BUILD.txt.
> Patch #3 adds note on Ubuntu Bionic.
> Patch #4 employs "latexpand" of TeX Live instead of "texexpand".
> This frees us from dependency on latex2html package.
> 
> Patch #5 updates FAQ-BUILD.txt accordingly.

Very nice!!!  Applied and pushed, thank you!!!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (5):
>   Makefile: Update help message
>   FAQ-BUILD: Add entry on compatibility of a2ping and Ghostscript
>   FAQ-BUILD: Add note on Ubuntu Bionic
>   Makefile: Use latexpand instead of texexpand
>   FAQ-BUILD: Remove latex2html in package list
> 
>  FAQ-BUILD.txt | 27 +++++++++++++++++++++++----
>  Makefile      | 12 ++++++------
>  2 files changed, 29 insertions(+), 10 deletions(-)
> 
> -- 
> 2.7.4
> 

