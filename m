Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234758AbhGBDsT (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 1 Jul 2021 23:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625197548;
        bh=UXoh1Y5uBnFM2JmRTayzTxo8weaOmL5EeykASFqKsuI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=P9pqeNnVajv035U+sDtlf73VpJTu5UuAqQA2qKO1tsitL3OGhdIPOfeNHlAuenbN/
         UaYUvb+gm8WoInbWD9LWJ9pu2DOyEU5tSzz5j1/ByLfvEQLJZuQKcVQ2UFvfIqnMKE
         qeauFPysisTMhATqfoBqjM1GBdLv2m3ft6LFwGU3gNpubVDpWrZYtCrRurytp8GdBf
         qZ5Yqx9zpoLfntU8HN2YNcB3n71Uunf4fAaJhQ+RPBrk3TkYJcqXtVagtFgv8OGEor
         +pMlGCQzkDotbTSLdL3YAg6iB87DYYs8Xtq/DyaZ6WT6jbKV+4VkorqRyWOAMvo1zI
         Zdc/uyuxdiHAA==
Date: Thu, 1 Jul 2021 20:45:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] future/htm: Remove ref to Tabel 17.3 in QQ
Message-ID: <20210702034547.GN4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <27d3f40f-e51f-7f92-1bfa-e64149a55b37@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27d3f40f-e51f-7f92-1bfa-e64149a55b37@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jul 02, 2021 at 10:52:21AM +0900, Akira Yokosawa wrote:
> Table 17.3 is not available in EBook-size builds.
> For compatibility, remove reference to the combined table in Quick
> Quiz added in commit 279c38a988f9 ("future/htm: Add some HTM
> hardware-reliability anecdotes").
> 
> Fixes: 279c38a988f9 ("future/htm: Add some HTM hardware-reliability anecdotes")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, queued and pushed, thank you!

> ---
> Hi Paul,
> 
> Current master fails to build "eb".
> I think reference to Table 17.3 is not essential to the Quick Quiz
> and just removed it.
> If you think otherwise, it can be made conditional by \IfEbookSize{}{}.
> 
>         Thanks, Akira
> 
> PS: As for hardware implementation of transactional memory,
> Power ISA v3.1 deprecated it [1].
> It might be worth mentioning it in the Answer to the QQ.
> In the post specter world, it looks like almost impossible for hardware
> designers to come up with a secure implementation of HTM...
> 
> [1]: Appendix A of Power ISA v3.1 at
>     https://ibm.ent.box.com/s/hhjfw0x0lrbtyzmiaffnbxh2fuo0fog0

Thank you for bringing this to my attention!  I have added it in
with your Suggested-by.

							Thanx, Paul

> --
>  future/htm.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/future/htm.tex b/future/htm.tex
> index abc80daf..3ff9bf24 100644
> --- a/future/htm.tex
> +++ b/future/htm.tex
> @@ -917,7 +917,7 @@ tab:future:Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM}.
>  }
>  
>  \QuickQuiz{
> -	\Cref{tab:future:Comparison of Locking and HTM,tab:future:Comparison of Locking (Plain and Augmented) and HTM,tab:future:Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM}
> +	\Cref{tab:future:Comparison of Locking and HTM,tab:future:Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM}
>  	state that hardware is only starting to become available.
>  	But hasn't HTM hardware support been widely available
>  	for almost a full decade?
> -- 
> 2.17.1
> 
