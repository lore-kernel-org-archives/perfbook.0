Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41121 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751060AbdHSCcv (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 18
 Aug 2017 22:32:51 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7J2SnRY135230
 for <perfbook@vger.kernel.org>; Fri, 18 Aug 2017 22:32:50 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2cebj720rw-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 18 Aug 2017 22:32:50 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 18 Aug
 2017 22:32:49 -0400
Date: Fri, 18 Aug 2017 19:32:46 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/4] Style guide updates (round 2)
Reply-To: paulmck@linux.vnet.ibm.com
References: <5db6cf8f-2061-5e14-07db-b64ebae2d2e4@gmail.com>
 <20170819002610.GB11320@linux.vnet.ibm.com>
 <d4c15bf3-b92c-e6c2-91ec-c11a61c4e1e0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4c15bf3-b92c-e6c2-91ec-c11a61c4e1e0@gmail.com>
Message-Id: <20170819023246.GC11320@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 19, 2017 at 10:04:17AM +0900, Akira Yokosawa wrote:
> On 2017/08/18 17:26:10 -0700, Paul E. McKenney wrote:
> > On Sat, Aug 19, 2017 at 08:29:29AM +0900, Akira Yokosawa wrote:
> >> >From af290804fbb9868bb242c8ad6d889d46dfa9add1 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>

[ . . . ]

> > I did have to find an arydshln.sty.  I ended up using this one:
> > 
> > http://ex.osaka-kyoiku.ac.jp/~fujii/dl/arydshln.sty
> > 
> > Is that a reasonable choice, or is there a better one elsewhere?
> 
> As mentioned in the commit log of 4/4 (and FAQ-BUIDL.txt updated there),
> you need "texlive-humanities" package for arydshln on Ubuntu Trusty.

Indeed you did, and it does work, thank you!

							Thanx, Paul

