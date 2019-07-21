Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yTO299CjX7BIlpyALkHMsJNFJpm74dMWkkSPd/aCpwM=;
        b=jD6CbygxZ9Fj3C4MPj9AcVJ52VgEEO4foiF6s73Os0Z+hRxqUVtl6Ss1mJrDJM2lnz
         g7CjhEVdJtwoHE/G44ENhlwVUwo76wDY04WCKYTZOkzs7IWEgFCEgn2r/c4UCCiwAKdU
         ZRKIYAboDaIDU4CQ2RklXZ71nrrfRw+fpJcevelwSlDXoqeD62R6Z7LEcuW+U4KwKUgf
         8c5P3PNhBOoL3f65STwdMee5bKS/pKm7oXEGQn7eTTUWNj/EjT5KKG7R2EagWPWLK0JJ
         g1LSKjsGVIFvzLnHQFNcEbSccrlR3BfOAGtsffHCmehxE5mQBO3xIKaYeB680KV2kRHy
         hBvA==
Subject: Re: [PATCH 0/7] Collection of small fixes and updates
References: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <20a9fbdf-54cb-1fe6-7392-a8c4361a3adb@gmail.com>
Date: Sun, 21 Jul 2019 09:17:59 +0900
MIME-Version: 1.0
In-Reply-To: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: Junchang Wang <junchangwang@gmail.com>, Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2019/07/21 8:59, Akira Yokosawa wrote:
> Hi Paul,
> (Cc: Junchang, Elad)
> 
> I've got somewhat distracted and couldn't properly compose change logs
> of patches I collected in a work-in-progress branch.
> Finally I managed to update the style guide to reflect enhancements in
> fcvextract.pl and amend the commit logs.
> 
> Patch #1 was the one presented to Junchang as an example to combine
> two code fragments in a code snippet.
> Patch #2 applies the new scheme to another fragment in rcu_nest.h,
> which was updated by Junchang.
> Patch #3 fixes type reported by Elad.
> Patch #4 updates FAQ-BUILD.txt for F29 and F30 users.
> Patch #5 removes remnant of quantum computing.
> Patch #6 applies the new scheme to another fragment in rcu.h, which
> was also updated by Junchang.
> Patch #7 is the update of style guide
> 
> Patches #1, #2, #3, and #6 are CC'd to Junchang or Elad.
Oops, looks like Patch #4 was CC'd to Junchang and Elad.
Junchang, Elad, Please ignore it.

        Thanks, Akira

> I don't think their Acks are musts in these cases, but would highly
> appreciate them.
> 
>         Thanks, Akira
> --
> Akira Yokosawa (7):
>   toyrcu: Convert Listing B.1 to new scheme
>   toyrcu: Extract Listing B.15 from rcu_nest.h
>   toolsoftrade: Fix typo
>   FAQ-BUILD: Update for recent Fedora releases
>   howto: Stop mentioning quantum computing
>   toyrcu: Extract Listing B.13 from rcu.h
>   styleguide: Update description of available options to \begin{snippet}
> 
>  CodeSamples/defer/rcu.h                 |  2 +
>  CodeSamples/defer/rcu_lock.c            |  2 +
>  CodeSamples/defer/rcu_lock.h            |  2 +
>  CodeSamples/defer/rcu_nest.h            |  2 +
>  FAQ-BUILD.txt                           |  9 +--
>  appendix/styleguide/samplecodesnippet.c |  2 +-
>  appendix/styleguide/styleguide.tex      | 76 +++++++++++++++----------
>  appendix/toyrcu/toyrcu.tex              | 50 ++--------------
>  howto/howto.tex                         |  2 +-
>  toolsoftrade/toolsoftrade.tex           |  2 +-
>  10 files changed, 66 insertions(+), 83 deletions(-)
> 

