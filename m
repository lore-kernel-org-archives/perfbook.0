Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12315 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1751493AbcGRGx6 (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Mon, 18 Jul 2016 02:53:58 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6I6rv9Y029631
 for <perfbook@vger.kernel.org>; Mon, 18 Jul 2016 02:53:57 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 2482gdjx55-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Mon,
 18 Jul 2016 02:53:57 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 18 Jul
 2016 02:53:53 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id A7F1A38C8039
 for <perfbook@vger.kernel.org>; Mon, 18 Jul 2016 02:53:50 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6I6roRh62193780	for <perfbook@vger.kernel.org>; Mon, 18 Jul 2016 06:53:50
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6I6roCF018072	for <perfbook@vger.kernel.org>; Mon, 18 Jul 2016 02:53:50
 -0400
Date: Sun, 17 Jul 2016 23:54:14 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] qqz: Add another hyperlink to black box in QQA
Reply-To: paulmck@linux.vnet.ibm.com
References: <0bf67306-7169-4ce5-ca66-b68c2833ee99@gmail.com>
 <20160717215900.GD7094@linux.vnet.ibm.com>
 <731d8ed0-deae-e159-a889-ba38822011e8@gmail.com>
 <20160717233606.GE7094@linux.vnet.ibm.com>
 <113d52db-a2b8-8900-8163-576e8129877f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <113d52db-a2b8-8900-8163-576e8129877f@gmail.com>
Message-Id: <20160718065414.GF7094@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jul 18, 2016 at 08:58:59AM +0900, Akira Yokosawa wrote:
> On 2016/07/18 8:36, Paul E. McKenney wrote:
> >On Mon, Jul 18, 2016 at 07:54:27AM +0900, Akira Yokosawa wrote:
> >>On 2016/07/17 14:59:00 -0700, Paul E. McKenney wrote:
> >>>On Sun, Jul 17, 2016 at 02:50:04PM +0900, Akira Yokosawa wrote:
> >>>>From 2a74b30f0a1d036e45c6aa5ef431034c23f790db Mon Sep 17 00:00:00 2001
> >>>>From: Akira Yokosawa <akiyks@gmail.com>
> >>>>Date: Tue, 12 Jul 2016 20:28:08 +0900
> >>>>Subject: [PATCH] qqz: Add another hyperlink to black box in QQA
> >>>>
> >>>>This commit adds another cross-link to the black boxes in QQA.
> >>>>I think this change would meet readers' expectation.
> >>>>
> >>>>Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >>>
> >>>I agree!  For reasons that are not clear to me, I had to hand-apply
> >>>this patch.  Might have been a white-space issue, which I did not
> >>>think to check for...
> >>>
> >>>Please take a look at the patch below to make sure that I did it
> >>>correctly.
> >>
> >>Yes, you did it right. I'm wondering what was wrong on my side.
> >
> >My guess is whitespace.  Or maybe the email got mangled along the way.
> >
> >>>Also, this suggests a possibility:  In the quick-quiz answer, suppose
> >>>that the heading and the black box link (as they do now) to the beginning
> >>>of the quick-quiz question, but that the white box links to the end
> >>>(or just after the end) of the quick-quiz question.  That way, the
> >>>reader could choose the return point.
> >>>
> >>>Would that make sense?
> >>
> >>Well, yes if readers expect the behavior.
> >>But for long answers, there are cases where you can choose only the white
> >>boxes in your view. I'm hesitating because of your reaction to the first
> >>attempt  the other day.
> >
> >All good points!
> >
> >>Anyway, I'm going to submit a patch for you to try.
> >>
> >>Also we'd also need to update the explanation in the answer of Quick Quiz 1.3
> >>if we actually do the change.
> >
> >Looking forward to it!
> 
> So, I'm submitting 2 versions of patch in reply to this mail.
> 1st one makes "the white box link to the end the quick-quiz question."
> 2nd one makes "the white box link to just after the end of the quick-quiz
> question."
> 
> Both of them are relative to current master.
> Please compare them and let me know which one you like.
> Or just apply the one you choose.
> 
> Then I'll compose the additional explanation according to your choice.

Before I do that -- which of the two do you prefer?

							Thanx, Paul

