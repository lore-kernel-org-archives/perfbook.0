Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54206 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1750858AbcHNIn4 (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Sun, 14 Aug 2016 04:43:56 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u7E2EJHt084146
 for <perfbook@vger.kernel.org>; Sat, 13 Aug 2016 22:16:12 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 24sw5xsjfw-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Sat,
 13 Aug 2016 22:16:12 -0400
Received: from localhost	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 13 Aug
 2016 20:16:12 -0600
Date: Sat, 13 Aug 2016 19:16:15 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFT GIT PULL v2] Makefile: Add ".fig -> .eps" rule
Reply-To: paulmck@linux.vnet.ibm.com
References: <2d788653-610c-bc99-0d70-f86b96056c7e@gmail.com>
 <20160811175403.GB3482@linux.vnet.ibm.com>
 <89115e47-37d6-b563-435e-6dbecf078963@gmail.com>
 <20160811233940.GH3482@linux.vnet.ibm.com>
 <88b66a0b-6b1b-2627-d262-c7c95a8aa69d@gmail.com>
 <54cbc8fb-9189-8ec3-b0cd-5e0b984e861f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54cbc8fb-9189-8ec3-b0cd-5e0b984e861f@gmail.com>
Message-Id: <20160814021615.GE3482@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Aug 12, 2016 at 10:56:11AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I've added the availability check of "fig2eps" in Makefile, as well as that of "dot"
> command which was added fairly recently to necessary commands.
> 
> I hope this helps people after the merge of branch.
> 
> If you want to see what the error message would look like, after pulling this branch,
> modify the definition of "FIG2EPS" or "DOT" macro around line 40 of Makefile,
> then "make neatfreak; make" will show a false positive error message.
> 
> This pull request is relative to the previous RFT pull request.

Pull the full group, thank you!

							Thanx, Paul

>                                                     Thanks, Akira
> -------
> The following changes since commit 641b6a5541323d737b1e2ca31e9a805da19514f1:
> 
>   FAQ-BUILD.txt: Add 'fig2ps' as necessary package on Ubuntu (2016-08-11 22:50:02 +0900)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git makefile-add-fig-eps-rule
> 
> for you to fetch changes up to 7f8776ab67bb37bccb7128dc67be6c85a5aacfb6:
> 
>   Makefile: Add availability check of 'fig2eps' and 'dot' commands (2016-08-12 10:39:36 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (1):
>       Makefile: Add availability check of 'fig2eps' and 'dot' commands
> 
>  Makefile | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

