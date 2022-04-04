Return-Path: <SRS0=JJuA=UO=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1iCdpJERbATKPIscON2vP26I4AQ5kntfBLGK7XR3uok=;
        b=EInwNG89gzGO2cVJrrmP4S9wN2TjQEAXFe1cujJUk8zzpVZEWjjFN2xQ99LV74UJdI
         16cZ7Zxz2b+iMVCJOGapS7CfWvnTiSR8lFGFDjHrrKLpyU/HUJp0KjLznLGGC7YvraL2
         SyLgWd5nH1xOhCQFFsexWFQuPJ40KLaZ2L8a9AnkquiYrCeuw45p452m0xFTKXFrylTi
         ZyCy+qf4qhu79HSR/bgozG+DQOTZVYNIbz8c6BpZwBPBtaBHqfsLitGEAFTq3CGH6ObL
         1Q0L8lhdmDQb3dXeLuNsq/Aow2356BG9xIVDhUkeVn+tcnqK6rTB8peOcjmUj060oxEt
         n6pA==
Message-ID: <5fbf67a9-5b73-dc3e-3965-284c767df427@gmail.com>
Date: Mon, 4 Apr 2022 09:06:11 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook 0/3] punctcheck.pl updates
Content-Language: en-US
References: <c1a39b48-6a99-9317-a074-e72bb45b374a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c1a39b48-6a99-9317-a074-e72bb45b374a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2022/04/04 9:00, Akira Yokosawa wrote:
> Hi Paul,
> 
> So, this series adds patterns in punctcheck.pl to detect misuses
> of punctuation markers "\@.", ".\@", and its friends.
> 
> Patch 1/3 adds the new pattern.
> Patch 2/3 adds hint messages to help you and other contributors
> see what is wrong.  Hopefully the added messages are clear enough.

I noticed some typos in the added messages just before sending this.
I'll send a v2 soon.

        Thanks, Akira

> Patch 3/3 fixes existing misuses detected by the added pattern.
> 
>         Thanks, Akira
> --
> Akira Yokosawa (3):
>   punctcheck.pl: Add pattern to catch reverse use of period markers
>   punctcheck.pl: Add hints in complaint messages
>   Fix period markers
> 
>  glossary.tex            |  2 +-
>  memorder/memorder.tex   |  2 +-
>  together/applyrcu.tex   |  2 +-
>  utilities/punctcheck.pl | 15 +++++++++++++++
>  4 files changed, 18 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 5f28b7cb0d4c447c9d6397770906c7cb4c96832c
