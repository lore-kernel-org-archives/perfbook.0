Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21184 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S932182AbcGDAmD (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun,
 3 Jul 2016 20:42:03 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u640dLjW040057
 for <perfbook@vger.kernel.org>; Sun, 3 Jul 2016 20:42:02 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 23x77wd2fy-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Sun,
 03 Jul 2016 20:42:02 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 3 Jul 2016
 20:42:01 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 6373038C803B
 for <perfbook@vger.kernel.org>; Sun, 3 Jul 2016 20:42:00 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u640g0bT65863832	for <perfbook@vger.kernel.org>; Mon, 4 Jul 2016 00:42:00 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u640g06r008388	for <perfbook@vger.kernel.org>; Sun, 3 Jul 2016 20:42:00 -0400
Date: Sun, 3 Jul 2016 17:42:06 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] another qqz improvements
Reply-To: paulmck@linux.vnet.ibm.com
References: <f8e63b55-fd26-8b7b-2b29-9d9b42d4e017@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8e63b55-fd26-8b7b-2b29-9d9b42d4e017@gmail.com>
Message-Id: <20160704004206.GJ4650@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jul 02, 2016 at 09:09:40PM +0900, Akira Yokosawa wrote:
> Hi again Paul,
> 
> So, this is another round of qqz improvements.
> 
> This time, I added cross link reference at the end of each QQ and QQA.
> For QQA, I picked a special character from 'pifont' package which looks
> like a white box.
> 
> See https://en.wikibooks.org/wiki/LaTeX/Special_Characters
> 
> Now, by clicking the black box at the end of QQ or white box at the end
> of QQA, you can go back and forth between main text and Appendix D.
> 
> 2nd patch improves accuracy of back link from QQA.
> 
> 3rd patch adds macro for referencing answer of QQ.
> 
> The 2nd one changes column/page break behavior a little, but
> I think it is acceptable.
> 
> Please give them a try.
> 
> Note that this pull request is relative to current master.

Pulled and pushed, thank you!  The white box is a nice touch!

I also queued a commit changing the QQ labels in the counting chapter
to be prefixed with "QcountQ".  The reason for this is to all more
independent work for people contributing to different chapters.
(Yes, I was foolish enough to try "QQ:count:" and "QQ_count_" before
remembering that latex only allows letters in command names.)

							Thanx, Paul

>                                                        Thanks, Akira
> 
> ---
> The following changes since commit 91ac20e1ab95767f1e33b84aee474d0cd38cc748:
> 
>   hlist_for_each_entry_rcu() now has only three arguments (2016-07-01 13:31:02 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git qqz-additional-ref-mark
> 
> for you to fetch changes up to f42deae9dbca3f7e6851a813c6504427c4dba809:
> 
>   qqz: Add macro for referencing quick quiz answer (2016-07-02 19:02:43 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (3):
>       qqz: Add cross-link reference at the end of each QQ and QQA
>       qqz: Improve accuracy of qqz back link
>       qqz: Add macro for referencing quick quiz answer
> 
>  perfbook.tex            |  1 +
>  qqz.sty                 | 17 +++++++++++++----
>  utilities/extractqqz.sh |  2 +-
>  3 files changed, 15 insertions(+), 5 deletions(-)
> 

