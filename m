Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37286 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1756283AbcGHWSe (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 8
 Jul 2016 18:18:34 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u68MEHl2071569
 for <perfbook@vger.kernel.org>; Fri, 8 Jul 2016 18:18:33 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 2415xpmucv-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Fri,
 08 Jul 2016 18:18:33 -0400
Received: from localhost	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Fri, 8 Jul 2016
 16:18:32 -0600
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id
 4E5F31FF0046	for <perfbook@vger.kernel.org>; Fri, 8 Jul 2016 16:18:14 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u68MIU7M62390502	for <perfbook@vger.kernel.org>; Fri, 8 Jul 2016 22:18:30 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u68MIUCx013700	for <perfbook@vger.kernel.org>; Fri, 8 Jul 2016 18:18:30 -0400
Date: Fri, 8 Jul 2016 15:18:43 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] Another round of qqz improvement
Reply-To: paulmck@linux.vnet.ibm.com
References: <fd3e2eb5-8080-489a-60fa-72836512dd64@gmail.com>
 <20160707024557.GI4650@linux.vnet.ibm.com>
 <38f7bfb9-8532-02fc-524c-bfe0cd9115c6@gmail.com>
 <20160707185228.GL4650@linux.vnet.ibm.com>
 <6d120f0b-09f6-d90a-6969-e12f027b479f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d120f0b-09f6-d90a-6969-e12f027b479f@gmail.com>
Message-Id: <20160708221843.GP4650@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jul 09, 2016 at 12:54:37AM +0900, Akira Yokosawa wrote:
> On 2016/07/08 3:52, Paul E. McKenney wrote:
> >On Thu, Jul 07, 2016 at 10:46:18PM +0900, Akira Yokosawa wrote:
> >>On 2016/07/06 19:45:57 -0700, Paul E. McKenney wrote:
> >>>On Thu, Jul 07, 2016 at 07:29:24AM +0900, Akira Yokosawa wrote:
> >>>>Hi Paul,
> >>>>
> >>>>This is another round of qqz improvement.
> >>>>1st and 3rd patch improve vertical spacings in Appendix D.
> >>>>2nd patch modifies the target of back link at the end of QQA
> >>>>to the end of QQ in the main text.
> >>>>This makes it easier to continue reading after reading an Answer.
> >>>>The white box at the end of QQA is added recently, and its change
> >>>>in behavior will cause little confusion if any, I think.
> >>>
> >>>Hello, Akira,
> >>>
> >>>I applied the first and third, but skipped the second.  I tried it, but
> >>>couldn't help thinking that showing the quick quiz upon return might
> >>>help with continuity.  "What was I doing again?  Oh, right, I just came
> >>>back to the quick quiz on the page."
> >>
> >>I see. I respect your preference.
> >>As a matter of fact, it took a few days for me to get used to the modified
> >>behavior. When you expect the behavior, it would feel smoother especially
> >>where a Quick Quiz is broken at the bottom of a left column in two column
> >>format.
> >>
> >>Anyway, I agree with you that current behavior is suitable as a default.
> >
> >I do plan to do another release soon, and the release note will highlight
> >Paolo's and your work on this.  So let's see what the readers think!
> 
> Oh, that would be of my great pleasure!
> 
> And how soon would the release be?

With luck, in a few days.  More likely in a few weeks.

> I'm preparing a (hopefully) final round of cosmetic fixes.
> It's getting larger than I expected. I need to cleanup the commits to
> distinguish actual fixes of something from just cosmetic ones so that you can
> review them easily.  It may take another week or so.

Well, unless the weekend's writing goes faster than normal (or, equivalently,
as fast as hoped), you should make the current release.  Otherwise, there
will be another release, hopefully much sooner than 18 months from now.

							Thanx, Paul

>                                                   Thanks, Akira
> >
> >							Thanx, Paul
> >
> >>>>---
> >>>>The following changes since commit 22af283e2a52cdf4a1c944fc97f00ce6a7a25ef8:
> >>>>
> >>>> Add diagnostics to route_rcu to reliably detect use-after-free (2016-07-05 15:52:16 -0700)
> >>>>
> >>>>are available in the git repository at:
> >>>>
> >>>> https://github.com/akiyks/perfbook.git qqz-use-vspace
> >>>>
> >>>>for you to fetch changes up to 746d78491c4dc47bcf72bfaf23724d568582d192:
> >>>>
> >>>> qqz: Give room for \parskip to suppress orphans (2016-07-07 07:07:17 +0900)
> >>>>
> >>>>----------------------------------------------------------------
> >>>>Akira Yokosawa (3):
> >>>>     qqz: Use \vspace{} for vertical spacing in Appendix D.
> >>>>     qqz: Modify back link target at end of QQA to end of QQ
> >>>>     qqz: Give room for \parskip to suppress orphans
> >>>>
> >>>>qqz.sty | 22 +++++++++++++++++-----
> >>>>1 file changed, 17 insertions(+), 5 deletions(-)
> >>>>
> >>>
> >>>
> >>
> >
> >
> 

