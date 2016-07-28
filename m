Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16464 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1161072AbcG1RlC (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Thu, 28 Jul 2016 13:41:02 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6SHd94p094035
 for <perfbook@vger.kernel.org>; Thu, 28 Jul 2016 13:41:01 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 24fj2n5y3u-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Thu,
 28 Jul 2016 13:41:01 -0400
Received: from localhost	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 28 Jul
 2016 11:41:00 -0600
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 165A43E4006C	for <perfbook@vger.kernel.org>; Thu, 28 Jul 2016 11:40:57 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6SHeuNh50790450	for <perfbook@vger.kernel.org>; Thu, 28 Jul 2016 17:40:56
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6SHeu7j013696	for <perfbook@vger.kernel.org>; Thu, 28 Jul 2016 13:40:56
 -0400
Date: Thu, 28 Jul 2016 10:40:57 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Some more feedback on Chapter 9
Reply-To: paulmck@linux.vnet.ibm.com
References: <a6181fde-e96e-294c-d0df-e996c27b401f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6181fde-e96e-294c-d0df-e996c27b401f@gmail.com>
Message-Id: <20160728174057.GS3873@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jul 28, 2016 at 10:06:22PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> There are still several issues regarding Chapter 9 I want to feedback.
> I'm afraid most of them are beyond my ability to submit as patches.
> 
> * At the beginning of Section 9.5.2, there is a credit of the form
>   "Authors: ...".
>   But there is \OriginallyPublished{} command just above the credit.
>   I'm wondering if the credit in the text is necessary.
>   There is a similar credit at the beginning of Section 14.2, but there is
>   no \OriginallyPublished{} command there. This section seems to have been
>   written for perfbook. If this is the case, for a consistent look, it would
>   be better if the credit is moved to Appendix F.1.

Good point!  I am guessing that these predated \OriginallyPublished{}, and
that I didn't get around to fixing them properly.  I have now fixed them.

> * Position of Quick Quiz 9.44 looks a little premature. SRCU is  mentioned
>   just after the Quick Quiz.

Good catch, moved.

> * The 2nd sentence of Section 9.5.4.4 ends as "... in the companion article."
>   This seems like a vestige of its origin in LWN. Should be fixed to match
>   the context.

Now it is "Section~\ref{sec:defer:RCU Usage}", good eyes!

> * In the introduction of Section 9.5.5, understanding of the whole Chapter 9
>   is listed in the prerequisite for the "toy" implementation. I suppose
>   recursion is not intended here.

You know, that is strangely appropriate, now that you mention it!  ;-)

But how about the following?

	Nevertheless, you will need a thorough understanding of Chapters
	2, 3, 4, and 6, as well as the previous portions of Chapter 9 for
	even these toy RCU implementations to be easily understandable.

> * Also in the introduction of Section 9.5.5, Section 9.5.5.2 is not mentioned.

Fixed!  Now "Section 9.5.5.2 through 9.5.5.9".

> * (Typo) In the 2nd paragraph of Section 9.7, there is a redundant "can" in
>   "... so that updates can can operate locally, ...".
>   (Yes, I can submit the fix of this one as a patch. If you want me to do so,
>   please let me know.)

I fixed it with your Reported-by.

And here is the Youtube video corresponding to that particular typo:

	https://www.youtube.com/watch?v=4Diu2N8TGKA

> * (Apart from Chapter 9) In Section 14.2.10.1, there are four instances of
>   $\dagger$ for introducing notes. I'm wondering if they can be converted
>   to footnotes. I'm not sure where they should be placed in the text, though.

Odd.  Those were there in the initial git commit.

I am removing the $\dagger$ commands and thus letting them be normal
paragraphs.

> I said earlier there were a few issues, but in the end there are a quite a few.
> 
> I don't mind if some (or all) of them be taken care of later after the upcoming
> release.

They were all reasonably easy, so might as well do them now.  Famous
last words.  ;-)

I commited and pushed them all.

							Thanx, Paul

