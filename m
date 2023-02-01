Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjBAWNE (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 1 Feb 2023 17:13:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE27FF01
        for <perfbook@vger.kernel.org>; Wed,  1 Feb 2023 14:13:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 072EA61975
        for <perfbook@vger.kernel.org>; Wed,  1 Feb 2023 22:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675289582;
        bh=fgZPdSxe887BypwCZSEK68lXWecv9ndSRc0AMTomKig=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=EnuMZ6HfJT2RNDZUhZxj0qAyhBKd3T71Y+ptsx9k4e7pWVW0mmUr3OJX1+9jhhU0Q
         0QJA5pzACFMyU+4UU1cqpat9/KndUHYc1pFP0P8M6PlyBeLAqTsYlYb1nCYP8QCSdN
         04nMOngehSsZ9OgOQnNLqSN/VeoPevDyDH0XmHrrLkIX3xvBsmtQbvqxi9yNVIkEsX
         BPJWQy36GpQo3QCbK5fQr8dCkgorfcs56Zofo0edC2UOcTiI+lxd4cGrp3sxFIcIwM
         JM6Gqy8mQ72euUyuYQKqU/OwkFItMrOmES7XZHBPr8H/lAhjVKkKpm9se7hgQHRCqN
         cgB0Td/Ks4o2A==
Date: Wed, 1 Feb 2023 14:13:02 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] Add .gitlab-ci.yml for pdf generation and testing on
 Gitlab.
Message-ID: <20230201221302.GQ2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230201201529.901316-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201201529.901316-1-leobras.c@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Leonardo Bras <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Feb 01, 2023 at 05:15:29PM -0300, Leonardo Bras wrote:
> Having this file merged on the main repository will trigger the Gitlab-CI
> on the mirror: https://gitlab.com/linux-kernel/perfbook/ after each push.
> 
> The way it works:
> - Compile-test CodeSamples
> - IF pass, build PDFs: regular, 1c, eb
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Queued and pushed, thank you!  Let's see how github (as oppoed to your
gitlab) reacts to this.  ;-)

							Thanx, Paul

> ---
>  .gitlab-ci.yml | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 .gitlab-ci.yml
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> new file mode 100644
> index 00000000..d131a4dc
> --- /dev/null
> +++ b/.gitlab-ci.yml
> @@ -0,0 +1,34 @@
> +image: archlinux:latest
> +
> +stages:
> +  - test
> +  - build
> +
> +test_codesamples:
> +    stage: test
> +
> +    before_script:
> +        - pacman --noconfirm -Sy make gcc liburcu
> +
> +    script:
> +        - make -C CodeSamples/
> +
> +generate_pdfs:
> +    stage: build
> +
> +    before_script:
> +        - pacman --noconfirm -Sy texlive-most fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts
> +        - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
> +        - wget https://sourceforge.net/projects/fig2ps/files/latest/download -O /dev/shm/fig2ps.tbz
> +        - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C /dev/shm/build --strip-components=1
> +        - make install -C /dev/shm/build
> +
> +    script:
> +        - make perfbook.pdf perfbook-1c.pdf perfbook-eb.pdf
> +
> +    artifacts:
> +      paths:
> +          - perfbook.pdf
> +          - perfbook-1c.pdf
> +          - perfbook-eb.pdf
> +
> -- 
> 2.39.1
> 
