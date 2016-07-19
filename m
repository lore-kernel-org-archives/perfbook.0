Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=BNi+GN6orT5mkEGIA5hc7DVEIX1hlKJMB6vlkyp3hAU=;
 b=M9ji6n0OSx3gZWLnijAJ0xJziyGjiiiU+rdH4GZ1SBIorKBEDhVMVEWdTcmygO0A7A
 wwX/hfotTcAGYUy+/XNhZfrJ+xd35ZN+zYaA51qxXdOdamy18kebEdQykOHTWSC+pkMq
 9GYlvlAKJiAMPPTVtmlzXKcIA6x9FiJup74qf4IfK+NNVi9AlF4mZrfbInHxXyDtwQhW
 HezG38e80GigubExMFqJh/vV3UMxKgVrHoq5zvJpUSh93kviohmK1fX8WTqajBg/QKkX
 BD1CPm64CwIFA+62a0b9uyvSJi2DxOD7qVt9z7FtFkv1Z+QV1e8TRCTf1zc0YeEkLn5x
 U3jw==
Subject: Re: [PATCH] formal: Trivial typo fixes
References: <ee5270b0-78c0-ae91-6a93-336968af2589@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6e78783e-7f09-931d-5981-ad11af4bd7b5@gmail.com>
Date: Wed, 20 Jul 2016 00:08:29 +0900
MIME-Version: 1.0
In-Reply-To: <ee5270b0-78c0-ae91-6a93-336968af2589@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/19 23:42 +0900, Akira Yokosawa wrote:

Hi Paul,

These are typos I noticed while reading recently updated part in "formal/formal.tex".

>  	Furthermore, although the L4 microkernel is a large software
>  	artifact from the viewpoint of formal verification, it is tiny
> -	compared to the a great number of projects, including LLVM,
> +	compared to a great number of projects, including LLVM,

Here, "the" and "a" are redundant. I removed "the", because I have no idea
how many projects are there in this context.

>  	gcc, the Linux kernel, Hadoop, MongoDB, and a great many others.
>  
>  	Although formal verification is finally starting to show some
> @@ -171,4 +171,4 @@ All else being equal, a simpler implementation is much better than
>  a mechanical proof for a complex implementation!
>  
>  And the open challenge to those working on formal verification techniques
> -and systems is prove this summary wrong!
> +and systems is to prove this summary wrong!
> 

This seems a trivial one.

                                                Thanks, Akira

