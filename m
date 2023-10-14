Return-Path: <SRS0=1PbI=F4=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697325767; x=1697930567; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKIiLl2SOSDZVjSe0UaEc7ncy2dMD0e544CzKmJsMM0=;
        b=DpKF2lBdPG8GPVnaxgWA6KXPcZyLm/SKAoXb2WnFbv4v+uEfRxeAKx0gDs8iY3zLMq
         arzbVM1Whxuu6rsKRwhUNfPOIq7G+3kwzuq2pkWIw3nTXf099OU/oT7w4JQeyKT5Y6uh
         LiRaIOjT762uyeUe67fGqPOT2E/3V3mH0A5+ljpxVrpImddjOcvT6HSQ1qxX+WiYc8io
         Slx4HKZI1FUV+VrFskmeW3vpDiDbN0UqunPHadul2rjsuMmUbm/wexyBj7jaV5goDHlW
         ffjyJeo+AEWABHx4sRVe7s3W9UElTrJZwqH5/BfZkB/B6sVMZcNFbuY2mOV66n/I01rx
         J8ZQ==
Message-ID: <d2caff5c-21bf-41c1-874f-194933ce0891@gmail.com>
Date: Sun, 15 Oct 2023 08:22:44 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook 0/3] Work around errors of unstable Inkscape
References: <603b38d3-7d46-4edf-869b-e688a1577b1c@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <603b38d3-7d46-4edf-869b-e688a1577b1c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2023/10/13 23:33, Akira Yokosawa wrote:
> Hi Paul,
> 
> I expected the crashing bug in Fedora's distro Inkscape would be
> resolved by the time of Fedora 39 release.
> I tested Fedora 39 beta and was disappointed to see more or less the
> same crashes of command-line runs of Inkscape as those under Fedora 38.
> 
> As a matter of fact, even when Inkscape crashes, the export of PDF
> is complete most of the time.  So the crashing bug can be worked
> around by ignoring the error code from Inkscape and continue building.
> 
> This patch set implements the ad-hoc workaround in build scripts.
> 
> As you can see in Patch 1/3, the workaround is enabled by default.
> This is because enabling it won't do any harm on systems with
> stable Inkscape.
> 
> I might be able to add some heuristics not to enable the workaround
> for stable Inkscape installs, but that can wait.
> 
> Ubuntu releases 22.04LTS, 23.04, and 23.10 are free of this issue.

No, Ubuntu 23.04 shows this symptom, rarer than Fedora but still...

        Thanks, Akira

> 
>         Thanks, Akira
> --
> Akira Yokosawa (3):
>   Ignore error of unstable Inkscape
>   Ignore emergency-save SVG files from Inkscape
>   Make sure all PDF conversions are complete
> 
>  .gitignore |  1 +
>  Makefile   | 17 ++++++++++++++---
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 84759ebac65a03aa28c5b02007e6c472b3416d3d
