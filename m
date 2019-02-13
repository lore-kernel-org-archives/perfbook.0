Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39752 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392017AbfBMQEk (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 13 Feb 2019 11:04:40 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x1DG4as3073185
        for <perfbook@vger.kernel.org>; Wed, 13 Feb 2019 11:04:39 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2qmmrfnmmt-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Wed, 13 Feb 2019 11:04:38 -0500
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Wed, 13 Feb 2019 16:04:29 -0000
Date: Wed, 13 Feb 2019 08:04:26 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 4/4] memorder: Remove 'snippet' meta command in stray
 litmus test
Reply-To: paulmck@linux.ibm.com
References: <1b7c8489-cf0a-d959-f307-e3eadae4998c@gmail.com>
 <f824fa58-c67a-afb5-68e2-cac8cf86660e@gmail.com>
 <20190212161631.GL4240@linux.ibm.com>
 <074fb553-9044-ded1-ab15-66f73350e7fc@gmail.com>
 <20190212234542.GV4240@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190212234542.GV4240@linux.ibm.com>
Message-Id: <20190213160426.GA10844@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Feb 12, 2019 at 03:45:42PM -0800, Paul E. McKenney wrote:
> On Wed, Feb 13, 2019 at 07:11:02AM +0900, Akira Yokosawa wrote:
> > On 2019/02/12 08:16:31 -0800, Paul E. McKenney wrote:
> > > On Wed, Feb 13, 2019 at 12:39:38AM +0900, Akira Yokosawa wrote:
> > >> >From 0ddf5c5ea4a66a0d6bff1b6c0ce32682459c20ad Mon Sep 17 00:00:00 2001
> > >> From: Akira Yokosawa <akiyks@gmail.com>
> > >> Date: Tue, 12 Feb 2019 23:18:29 +0900
> > >> Subject: [PATCH 4/4] memorder: Remove 'snippet' meta command in stray litmus test
> > >>
> > >> C-SB+o-rcusync-o+rl-rul-o.litmus is identical to
> > >> C-SB+o-rcusync-o+rl-o-rul-o.litmus and causes "make" to emit
> > >> warning:
> > >>
> > >>     target 'CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o@whole.fcv'
> > >>     given more than once in the same rule
> > >>
> > >> This commit removes "snippet" meta commands in the test.
> > >> Just removing the file can cause a build error afterward.
> > >> A "make clean" will resolve the error, but keeping the file
> > >> looks like a reasonable approach to avoid surprising people.
> > >> The file can be removed in the near future when most active
> > >> users have updated snippets.d.
> > > 
> > > Unless I am confused, this litmus test appears as Listing 15.37.
> > 
> > Listing 15.37 is "C-SB+o-rcusync-o+rl-o-rul-o".
> > The file I modified is "C-SB+o-rcusync-o+rl-rul-o.litmus" (note the
> > missing "-o-" in the final part") but contains the same test
> > "C-SB+o-rcusync-o+rl-o-rul-o". There exists
> > C-SB+o-rcusync-o+rl-o-rul-o.litmus which contains the same test
> > "C-SB+o-rcusync-o+rl-o-rul-o". So C-SB+o-rcusync-o+rl-rul-o.litmus
> > can be safely removed. But this patch removes the snippet meta-commands
> > instead.
> > 
> > Have I made the point clearer?
> 
> You have!  My confusion stemmed from the fact that these two files
> are identical, as you say:
> 
> CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-rul-o.litmus
> CodeSamples/formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus
> 
> I was searching based on the name within the file rather than the
> filename.  In short, we can just get rid of the unused file.
> 
> Apologies for my confusion!

And I have removed it with your Reported-by, and thank you for catching this!

							Thanx, Paul

