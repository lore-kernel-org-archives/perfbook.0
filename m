Return-Path: <SRS0=96tr=6D=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ovvaLw5X/9iNGfJhNqqf1RWLC2iOycT3p4KoKPuhSVg=;
        b=IaCYcxTrmqRotM6/s5pzcuKxI9ywcwxaizFAAc+GoMIgDzcQI3zjjzdEzOca/hVsAh
         nDM2KOmCaQPInK3LLkbx3w5ETQdu/7zXP3IHrUUD19QCt8/NitFYGqnyhBLGUQF/9vDq
         I5CCO+IHTiU4dfXFYwOnEhUGfGWksgKDRT/rct2Vz6kIEqI8lO2clCMD7SuGdpyaX6Dm
         5olV0/KALAtyFscSoUvOAxAmYlTyDRdUZJ8uY0nfgWOVERx+MFhP/ch/CeG0TpMN/9vs
         gOKK2TvXl64j8ASSL/JyENC508dIhJRGCLOAR1sxjgnmiOFZhxg+zWod3e5dsrnJcoyk
         Cw2A==
Message-ID: <e983bd58-3a43-8138-cf57-7f7a44f52cfb@gmail.com>
Date: Tue, 7 Feb 2023 09:19:09 +0900
MIME-Version: 1.0
Subject: Re: [PATCH v1] utilities/gitlab-ci: Change base machine type to 2-cpu
 to fix make check
References: <20230206205514.442896-1-leobras.c@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230206205514.442896-1-leobras.c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Leonardo Bras <leobras.c@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Mon,  6 Feb 2023 17:55:15 -0300, Leonardo Bras wrote:
> `make -C CodeSamples/ check` currently fails on Gitlab-CI.
> 
> Failure happen on sched_setaffinity:
> sched_setaffinity: Invalid argument
> 
> Further debuging, it's possible to notice that some tests are trying to set
> the cpu affinity in CPUs 0 and 1, so at least 2 cpus are needed for the
> test to run properly.
> 
> Current (default) saas-linux-small-amd64 instances used for testing on
> Gitlab-CI only offer a single CPU, which is not enough.
> 
> For the test_codesamples pre-test, change the instance type to
> saas-linux-medium-amd64 so the tests can run properly.
> 
> Fixes: 9217963c ("utilities/gitlab-ci.yml: Add 'make check' on
> test_codesamples")
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Hi,

I see that this change worked at:

    https://gitlab.com/linux-kernel/perfbook/-/jobs/3723917786

So FWIW,

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

I don't have a list of minimum CPU count for programs under
CodeSamples/, but I guess there are a few which need more than
two CPUs.

You might need to add conditionals in Makefile to exclude those
tests depending on available CPU count.

        Thanks, Akira

> ---
>  utilities/gitlab-ci.yml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> index 9545029e..42eda60f 100644
> --- a/utilities/gitlab-ci.yml
> +++ b/utilities/gitlab-ci.yml
> @@ -5,6 +5,7 @@ stages:
>    - build
>  
>  test_codesamples:
> +    tags: [ saas-linux-medium-amd64 ]
>      stage: test
>  
>      before_script:
