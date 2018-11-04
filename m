Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=74RBSALam+wzdaaONjZPHhzwyNACdDTuCWCWHmS8Vmw=;
 b=ifTq2VT7IVwlzblh5hsOQ0Vo3+m6CRE7RmIKzm2p04QHQOYfP2bzG+xOAI1PtY5IeZ
 1My5bb5tx5DGXckbtbZSLMr3mifRG0ottygI0vAUL/WLdKGPMnvlavzo/nrNevPYtFgM
 zkVGWfR5KFDgQl9m868gxECiF/KyCwR/UgVyGA53RtY1VYQgjQJ3M1qMhuaJn/ojwOA7
 0p6x7M6pYWZrGOg3aLXYLGAEabc65ThF06NP8UPR04Dw4zWDavdkZLE4hSi1+BFzX+vx
 gOFi/ScMsoBzqbyD3UZRY0m7mZ+ljUsz+o/65WhsAzQ6GNPf1K9CYMWi0hPxRGLeXx4a
 S9Vg==
Subject: Re: [PATCH 0/2] Updates to Chapter memorder
References: <1541330319-14491-1-git-send-email-junchangwang@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3efe6951-cade-b721-96e3-7d41e1c39734@gmail.com>
Date: Sun, 4 Nov 2018 21:04:28 +0900
MIME-Version: 1.0
In-Reply-To: <1541330319-14491-1-git-send-email-junchangwang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>, paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2018/11/04 19:18:37 +0800, Junchang Wang wrote:
> Hi Paul and Akira,
> 
> I have read through the first half of Chapter memorder, and here is correction
> for a few typos. Please take a look.
> 
> For the first patch, the last clause I modified still looks confusion to me.
> Currently the clause is "though only if both \co{r1} and \co{r3} both end up
> containing the address of \co{x}"; however, my understanding is that prior load
> or store would also be ordered before the store on line 16, __only if r1 ends up
> containing the address of x__. That is, it is not necessary to involve r2/r3. Is
> my understanding correct? Or did I miss anything about this in the book?

Going back to commit 43236beadb19 ("memorder: Expand on cumulativity and
{other,} multicopy atomicity"), this paragraph discussed Listing 14.17
at the time (WWC Litmus Test With Release), which is a different litmus
test than the current Listing 15.17 (WRC Litmus Test With Release).
Still line 32 of then Listing 14.17 was an "exists" clause.
No wonder you can't figure out what is discussed there.

Paul, can you look into this?

        Thanks, Akira

> 
> 
> Thanks,
> --Junchang
> 
> Junchang Wang (2):
>   memorder: fix typo
>   memorybarriercum.svg: fix typo
> 
>  memorder/memorder.tex         | 8 ++++----
>  memorder/memorybarriercum.svg | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 

