Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39900 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932639AbdCGUX5 (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 7
 Mar 2017 15:23:57 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v27JNdTx134144
 for <perfbook@vger.kernel.org>; Tue, 7 Mar 2017 14:28:01 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2921kac03m-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 07 Mar 2017 14:28:01 -0500
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 7 Mar 2017
 14:28:00 -0500
Date: Tue, 7 Mar 2017 11:27:57 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] Use \tco{} macro within caption and section header
Reply-To: paulmck@linux.vnet.ibm.com
References: <288315d7-4311-6734-b7d3-446deca6a727@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <288315d7-4311-6734-b7d3-446deca6a727@gmail.com>
Message-Id: <20170307192757.GU30506@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Mar 07, 2017 at 11:59:34PM +0900, Akira Yokosawa wrote:
> >From a51c44bef0dbc05bd95391ac3f8f0f2d26becbf5 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 7 Mar 2017 23:35:32 +0900
> Subject: [PATCH 0/3] Use \tco{} macro within caption and section header
> 
> Hi Paul,
> 
> This is the 1st patch set I have tested locally for a while.
> The objectives of this and the following patch sets are as follows:
> 
>   o Use \tco{} macro within caption and section header
>   o Use modern packages such as enumitem
>   o Convert itemize or enumerate lists to description lists
>   o Add another alternative monospace font target
> 
> This set corresponds to the 1st one.
> Patch 1 is an independent change to manage "microtype".

Much nicer!  Also makes it easier to search the .tex files for
symbol names containing underscore.  Queued and pushed, thank you!

						Thanx, Paul

>                                     Thanks, Akira.
> --
> Akira Yokosawa (3):
>   perfbook.tex: Disable 'microtype' for typewriter font
>   treewide: Use \tco{} for api name in caption
>   treewide: Use \tco{} for api name in subsubsection title
> 
>  appendix/whymb/whymemorybarriers.tex |  2 +-
>  debugging/debugging.tex              |  2 +-
>  future/tm.tex                        |  2 +-
>  locking/locking.tex                  |  8 ++++----
>  perfbook.tex                         |  4 +---
>  together/refcnt.tex                  |  6 +++---
>  toolsoftrade/toolsoftrade.tex        | 38 ++++++++++++++++++------------------
>  7 files changed, 30 insertions(+), 32 deletions(-)
> 
> -- 
> 2.7.4
> 

