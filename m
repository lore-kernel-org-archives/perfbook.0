Return-Path: <SRS0=sCbS=6I=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jnAd6Q+YB46lpjNgb3VnzFNQ4cGX72N5aZyklzS0/CE=;
        b=bOFnPw4tBEEndzyPqBjZGjCTKBB6xDddmgdWuLD1RJKMB2DlCdAhCoz1RLpKpdB52W
         lc8xirTQrWKgm0gx3jTRIukN+lw/fulzZ328dwuJaCGh3pNG43gbvD7Nbj1dWkjPkzmq
         cauSsdJhBXXrmoDMb4KRR/gtPJIPzCMzb2lUnVoVe8I21Me9978pGi2m8Jgfd4d3Po2p
         f2vAULF0vr2VTbE8VivmvAMp0Sv++NBopAA6kn/R8xFPFBLEGjuK5cmgsuKJZfpfFm+h
         LOgMUp5X0p65B0Eueur/G3cFrIrzoAmI1II+tVzMDfvQQEu2HVbG3GhOQ/BWAZw814zb
         4tyw==
Message-ID: <1acbe0e5-92ae-fa92-0b1e-0e8ed7d4f8a6@gmail.com>
Date: Mon, 13 Feb 2023 08:57:58 +0900
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/4] debugging: Trivial fixups
References: <20230212165630.26268-1-sj38.park@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230212165630.26268-1-sj38.park@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj38.park@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, sj@kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 12 Feb 2023 08:56:26 -0800, SeongJae Park wrote:
> Changes from v2
> - Fix subject of patch 1 (Akira Yokosawa)
> - Remove redundant following sections intro instead of making it
>   explicit (Akira Yokosawa)
> 
> Changes from v1
> - Use 'qco{}' for quoted strings (patch 1, 2) (Akira Yokosawa)
> - Explicitly distinguish section and subsection (patch 4) (Paul E.
>   McKeneeny)
> 
> -----
> 
> This patchset contains trivial fixups for debugging/, which found while
> doing Korean translation[1].
> 
> [1] https://github.com/sjp38/perfbook-ko_KR
> 
> SeongJae Park (4):
>   debugging: Use \qco{} for 'time' output examples
>   debugging: Use \co{} and \qco{} for 'git' and 'Fixes:', respectively
>   debugging: Remove unnecessary space in a sentence
>   debugging: Remove redundant following sections introduction

For the series,

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

        Thanks, Akira

> 
>  debugging/debugging.tex | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
