Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:35619 "EHLO
 mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750759AbeCDFRL (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 4
 Mar 2018 00:17:11 -0500
Received: by mail-pl0-f67.google.com with SMTP id bb3-v6so7907022plb.2 for
 <perfbook@vger.kernel.org>; Sat, 03 Mar 2018 21:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rXZhJrm/eMoOAfrsg3/eOjoI2TM1zJrLzdv9eN8fvqA=;
 b=vBBvOxVvJesSfhgLXPyNtNqRV/8FlQt/oXB0JooKepxadDeP5yyBVX0MlIvTiGhgFA
 eWs2dLTPnChqNfMI3Es4yulItSplEAUA4XfiFWlej7KbtzZjn8yp+xR6nDImI+C0Xop3
 3bKV8TXxkP2bYuyCp6bloFfAa+8VOzfTc1CUmty/gI8k7AspkVbJVSNAINSsiekSATm8
 G4+RCu5vQVLfJ2UauwenUGys03gQ1dcDjZ+t7XYNIl4oRT2IUm9fDYgMvN/lIdCSD93K
 6n5QTPzcXOaYnrFZOROzT14uGYIPVSUqW4uKSJ9YqAibAEVJZaP754TQa2f6K4y1ukTY
 8bCA==
Date: Sun, 4 Mar 2018 13:16:28 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Re: smp_read_barrier_depends() into READ_ONCE()
Message-ID: <20180304051628.GA19219@HP>
References: <20180304021305.GA4449@HP>
 <da538fa2-dd74-88ab-e302-429de922145c@gmail.com>
 <145d7558-f970-5740-a831-89db9edee764@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <145d7558-f970-5740-a831-89db9edee764@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Mar 04, 2018 at 12:43:07PM +0900, Akira Yokosawa wrote:
> On 2018/03/04 12:11:14 +0900, Akira Yokosawa wrote:
> > On 2018/03/04 10:13:05 +0800, Yubin Ruan wrote:
> >> Hi paul,
> >>
> >> Please provide the commit link/hash for the changes of
> >> smp_read_barrier_depends() in the kernel. I remember that it was post by Akira
> >> once on the mailing list, but not sure I can get the right one.
> >>
> >> Thanks,
> >> Yubin
> >>
> > 
> > Hi Yubin,
> > 
> > It's 76ebbe78f739 ("locking/barriers: Add implicit smp_read_barrier_depends() to
> > READ_ONCE()").
> 
> FWIW, it was cherry-picked into x86-pti branch as commit c2bc66082e10, which was
> also merged in merge-commit f8940a0f20eb ("Merge branch 'WIP.x86-pti.base-for-linus'
> of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip").

Thanks Akira ;-)

Yubin
