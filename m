Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=VQy58JVPu15qSMZ6lSG7Dg+WIAjtKZQtBuicDfYJxzU=;
 b=kAOKM8BlrOPts2ZfdG2/ipED0TNe8miYuQlvR3qZtQcfV2seMeI/KFAZNRhPdLgwp/
 AvzxBR2uZNEYiMl3H90qnfSWvVjaX/KUpMYpc3h6vFNvsB38LdlPf8nZ7n03tljBjFQJ
 /qUmfN/FBHvhUCVQMBLGB/Jfq4JQfeUOa0y806JC4pcSy+z8boMiQdqBo3hxnQnp1n69
 +jAoLhcv8fbuWlHyXqKuHZSWmR5Ot/rFiW7S1WFT6jCqFyZk7DNquTXaWUuC4zPsewdm
 wN5YyBAG2759mV5re7To5Z+TLD3aKVAQIP4qdUy+5RcTS6O6nXc+Ctnu5rLr7LnODCR/
 ukSQ==
Subject: Re: [GIT PULL] Fix false positive font warning and update related
 documents
References: <fa43435b-6096-8984-3f7e-495a40f0eff3@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b853db7d-bf1e-ed7c-5605-26b0ec4f5cfe@gmail.com>
Date: Sat, 21 May 2016 09:08:02 +0900
MIME-Version: 1.0
In-Reply-To: <fa43435b-6096-8984-3f7e-495a40f0eff3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/05/21 8:53 +0900, Akira Yokosawa wrote:
> The following changes since commit adc5a0ed9702d1fa2ec8620b1ff16ed2fbd6b9a4:
> 
>   Fix typo "baloon" -> "balloon" (2016-05-18 18:30:31 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git fix-false-positive-v3
> 
> for you to fetch changes up to 810776b53db7b6194f6b2f0e0dd6a474e2090a91:
> 
>   Improve messages regarding font installation (2016-05-21 08:45:20 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (2):
>       Fix false positives in font check
>       Improve messages regarding font installation
> 
>  FAQ-BUILD.txt         | 6 +++---
>  howto/howto.tex       | 9 +++++----
>  utilities/eps2pdf.sh  | 4 ++--
>  utilities/runlatex.sh | 4 ++--
>  4 files changed, 12 insertions(+), 11 deletions(-)
> 

Hi, Paul.

I made a wrong squash in this branch.
I'll fix it and resubmit another pull request later.

                                                       Thanks, Akira

