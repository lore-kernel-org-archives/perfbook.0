Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:65022 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730265AbfHFQZr (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 6 Aug 2019 12:25:47 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x76GHJXt113237
        for <perfbook@vger.kernel.org>; Tue, 6 Aug 2019 12:25:46 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2u7auc6kf9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 06 Aug 2019 12:25:45 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x76GHWMH113902
        for <perfbook@vger.kernel.org>; Tue, 6 Aug 2019 12:25:45 -0400
Date: Tue, 6 Aug 2019 09:25:44 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] Create .mailmap to fix unreachable email address
Message-ID: <20190806162544.GP28441@linux.ibm.com>
Reply-To: paulmck@linux.ibm.com
References: <154feeee-a7b3-17bd-6b26-6ff1778e8b42@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <154feeee-a7b3-17bd-6b26-6ff1778e8b42@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Aug 07, 2019 at 12:45:34AM +0900, Akira Yokosawa wrote:
> >From 327971006462cbab7b5007717d7536b0e3947eb4 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 7 Aug 2019 00:15:12 +0900
> Subject: [PATCH] Create .mailmap to fix unreachable email address
> 
> There are some commits with typo in my gmail address.
> Although they can not be fixed after the fact, "git shortlog -se"
> and "git show --use-mailmap" respect entries in .mailmap.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good point, queued and pushed, thank you!

While in the area, I added commit to allow for my recent email address
change and some early git misconfiguration.  ;-)

							Thanx, Paul

> ---
> Hi Paul,
> 
> Inspired by discussion in another thread, I looked up the usage of
> .mailmap in Git repository. It can be used to partially rescue typos
> in email configs such as those made in the early days of my contributions.
> 
> This will prevent the unreachable address from being displayed by
> "git shortlog -se" and the like.
> 
>         Thanks, Akira
> -- 
>  .mailmap | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 .mailmap
> 
> diff --git a/.mailmap b/.mailmap
> new file mode 100644
> index 00000000..c5d1cd3e
> --- /dev/null
> +++ b/.mailmap
> @@ -0,0 +1 @@
> +<akiyks@gmail.com> <akiysw@gmail.com>
> -- 
> 2.17.1
> 
