Return-Path: <SRS0=8Upf=6C=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afoV1emkq5/4lG8+uQzWIzaaiVGp19N00dndiVx4MUg=;
        b=QPW3gLZgqm/XXWZFuPCMEx18q/Ch/UnwZEEnJuoNXjHEb5jhBhBFzTOp2FVRCqb488
         OhpeereAokZ6XgwqIT1lrd+iYffzno0JtJZ90zZV4nZE5RmNYDYqcs24LL8VyelO/AXx
         ZkAEmCQrcpQ8Zf+y59zkvRQdREbnqrf1+q+11Dt/EqguE2OX7AfDR6QIuoIaA65ioQgV
         b6xaBFR8lCZ1NXjQUNAyXRbQelSJOtlyqb/GL23BjMti1/7v5PE0GAUiaNocUDFJq6+Y
         orzG1SqEFQjDwmdKBpdWX929+8KIIPg2NYPBg6fSZVdqmT40v6EiWHYF/fo896CsyN+/
         9MvQ==
Message-ID: <c6d41ba9-ca6e-cfb7-5df5-f4e7a9de058f@gmail.com>
Date: Mon, 6 Feb 2023 12:01:57 +0900
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] debugging/debugging: s/remainder of a
 section/following sections/
Content-Language: en-US
References: <20230205182128.19044-1-sj@kernel.org>
 <20230205182128.19044-6-sj@kernel.org>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230205182128.19044-6-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj@kernel.org>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun,  5 Feb 2023 10:21:28 -0800, SeongJae Park wrote:
> From: SeongJae Park <sj38.park@gmail.com>
> 
> A sectence in 'Microbenchmarking' section is mentioning the remainder of
> the section will look at ways for dealing with conflicts in measurement
> error advices, but those are not dealt in the remainder of the section
> but its following sections.  Fix the sentence.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  debugging/debugging.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index 53c7fb94..225a4184 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -2302,7 +2302,7 @@ to creep in, including:
>  
>  The first and fourth sources of interference provide conflicting advice,
>  which is one sign that we are living in the real world.
> -The remainder of this section looks at ways of resolving this conflict.
> +The following sections look at ways of resolving this conflict.

If you interpret "The remainder of this section" as "The remainder of
Section 11.6.4 'Hunting Heisenbugs'", there is nothing to fix.

We call all of section, subsection, and subsubsection as "Section",
which might be confusing sometimes, but I don't have any idea what
should be done here.

        Thanks, Akira

>  
>  \QuickQuiz{
>  	But what about other sources of error, for example, due to
