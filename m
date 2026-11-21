Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795284565;
	b=hv5Nx9PNooFw1Wb/LeHuDazBvYvF3HG4/Dn+Aczlsx+k8RUOQOMtsoNEXWZyc99Gqac8
	 HXdPTzVu8VhUuDzzpGqemTa124RhDnjV9gv0zvFM0mULL6S6Y/ElQtlZS1i9AgefvBrGj
	 5D3ycSqd8WwRz/3TZnwD9eG9yhFrll+GTgM9YlpP9qMBtzVY2wnqkixm0Smz2L7Pzg+NY
	 lxoE0iVuaWe0lAadZzwvj3/r2jVelwkuIdjWN8tLMSE5y/Ft2XFrZnJA3LRLD6EcnxGIC
	 vLkwXX/raC6W8TqvS7R+Z3SIb2aSrZbA0WSqzbMah1kC2s/b12QRLfeUrQ6UHR+r0nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795284565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=zdMtFuTSIrN2qmkSAereHqAnISNbZbBfqIHHDvF3Q0M=;
	b=mrB9p3WIPTeYBptosXttudE8xiqU8huap0sy8pvpGJZLJ25oTMs8rtsn6H5lvdBBk9lK
	 U1d+gF+iQXiKspqiKZibdVWBoQS1JBfqIoen1G7UFLtIaeObvsI+H8KqR5HwuOF6ldKl/
	 UJF0tAzMptZFQZR8sWamKa+Bju/1orYi9WV6q0DM1QB1odUTgyk7JFaji+7lbFE1HcB2c
	 yt7awUhshoTe12KDfudw4ajyGmAyC/DJfT/9IlBnsL3xFoV1My7Cv1sXZeOiNr93UeVp6
	 lO5XS5qsKymqOzF3ZbJM8BIl7XSdkOOe+Z57oARDJdeWTvOeJY01zUwYx6sLJWolTEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uU86bpVB;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A44606A320
	for <perfbook@vger.kernel.org>; Sat, 21 Nov 2026 18:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A44606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uU86bpVB
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so18184565e9.0
        for <perfbook@vger.kernel.org>; Sat, 21 Nov 2026 10:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795284563; x=1795889363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zdMtFuTSIrN2qmkSAereHqAnISNbZbBfqIHHDvF3Q0M=;
        b=uU86bpVBx9JlxyUMBzQ1juplwSnjINeE2EKKmwwfu5uK857Y7wgkpUMIDgMJiTG+Mf
         8jlkCGYWL0AhVa2v8lQ1iL/Ly1tvDdpt34um6G6EeQk07Fu0fCJYkscYgC6fsMm6K+mF
         ajgwbMmbX+mmgHO1fXhyY0IkZ8w5SGulsXN44ZprgiQCEYr2NI2CekRrCAGun4ohcEfm
         fj76sdIIPmO57QRSKW6HENXkY/dwcMBcgVxPmvxZCSRMcCtN0BzP/S+tbeccgfZDQIRp
         iCMVfsZnFmF2BhPFAR5knAmoojUmIv9Zc8beymluqovcKsWbx9mDZbw5rl7KEnP0NKVG
         1ZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795284563; x=1795889363;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zdMtFuTSIrN2qmkSAereHqAnISNbZbBfqIHHDvF3Q0M=;
        b=1QbwdaMyjTnk6Tc5bt0wJ3GDM8RLK/BqOmRX6t4miFuJz4/f5cgIapufPod3nrThEA
         EWp24KRk7y8YYPzyLh6hQJbxQg1V8PVgVTItZcidLXot+uPtwQTJ2QFlRRm6oJqYARuR
         AEvL+3ophC/PMYQl/WkdCwz2TbVjHZ3tJM8SW3nKLNZkow6X2EE3U+C/Sm/87LGdGZC6
         zrfL7fIsFGW60EbBvFwGBzojcGWmYyAPOLq1gVdR5uqPXnG8i3ZRbAM7IsAvVay9Woko
         yL7UcypXFsWP+7JfVVaAyP7yrLh7xDkmah9APRO/tBbSFRaqub0FZTCqJrLHiYNpCVm+
         GgAw==
X-Forwarded-Encrypted: i=1; AL+hErFE/DQFPi8nd3pfr5W5xNpyFyUargCZnJ55GgFzurnWq7uo6wY2kxQueQhpj5wkInCb0bU+9RwFlA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+dLPvMGWVSx627fBZbUyrXVtpELHQVGHa43lleqD7BCzirXDx3
	uqwoZaskwYR701gXGwBBdtfdrYVf/3CC0sXmr2tbhHGaiGPEojBy7DSn
X-Gm-Gg: AZFdTZfFVdDyBU98sGo3xyt9T5JOAYpAK20dlL2a4/We7KtfuIWe0hO4eUU/CnE9/fp
	45Wvh3cZHgxIdyxXnkI688ltnzmXsskg8tsq9plQhKT47Gu1uoRJUfJtQsyrN0TuwSIFrO7bNFs
	9Z7rAkV4Ga1K5mBEfXvEqiZthEZQlPtrR97PUua77cYMYDhQNSb0lZZKrC/fnsuGX4FfR5vd78V
	AoPu6PFyDEBi3qBrfy67s4fcPRoyhuKzjSEXZWJWtBM70DzY7M9ihCJcfABfvs6L8Yq8w24uZtL
	sPsGKfT8kxQ8oJWSGN3bZ9LE+/CGDbP1y6NklIRR3K/TN9sAgCGWwD2sbTU85Hbf4xJxP2iv6zJ
	Um/C71Sy3sP0SFxM/QDbvIigAmz+SzsAwENFFvKmwSCu8WIm2hSp6nCv/EtLTYhqgHVW9MpBhc+
	Nd9/J4Oa1nZ9f77aqjNp0FrS3Q1soKWpHuE025mAxfuhda0CoY+xeH16ALNdfYMiRfDEEspVZ43
	/tacf725zxlya2k5Pv2LjOqTQ1loRlK7OhY2arAiGjzwVyY3OINc+mmGZCuEZyBXztf9CqJXfTG
	7Bj4veiFjgSHVoxZbx9melVF6d6ookOB54fDRlvI
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb88922df3mr142665155e9.12.1795284562772;
        Sat, 21 Nov 2026 10:09:22 -0800 (PST)
Received: from WindFlash.powerhub ([2a0a:ef40:e42:6801:83dd:7493:26d0:2927])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm209609025e9.5.2026.11.21.10.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:09:21 -0800 (PST)
From: Leonardo Bras <leobras.c@gmail.com>
To: Ferenc Fejes <ferenc@fejes.dev>
Cc: Leonardo Bras <leobras.c@gmail.com>,
	perfbook@vger.kernel.org,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [RFC PATCH 7/7] docker, gitlab-ci: Add EPUB build dependencies and CI job
Date: Sat, 21 Nov 2026 15:09:20 -0300
Message-ID: <awHeUP4OFZPtgaB4@WindFlash>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115210138.229034-8-ferenc@fejes.dev>
References: <20261115210138.229034-1-ferenc@fejes.dev> <20261115210138.229034-8-ferenc@fejes.dev>
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Post: <mailto:perfbook@vger.kernel.org>
List-Help: <mailto:perfbook+help@vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
List-Owner: <mailto:perfbook+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Nov 15, 2026 at 10:01:38PM +0100, Ferenc Fejes wrote:
> Install pandoc, unzip, zip, and texlive-lang-japanese in
> docker/Dockerfile for EPUB builds.  Add a non-blocking generate_epub job
> in utilities/gitlab-ci.yml that builds and archives perfbook.epub and
> perfbook-endnotes.epub.
> 
> Signed-off-by: Ferenc Fejes <ferenc@fejes.dev>
> ---
>  docker/Dockerfile       |  2 +-
>  utilities/gitlab-ci.yml | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/docker/Dockerfile b/docker/Dockerfile
> index ee120e4b..063a678b 100644
> --- a/docker/Dockerfile
> +++ b/docker/Dockerfile
> @@ -9,7 +9,7 @@ RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=UTC apt-get install -y t
>      rm -rf /var/lib/apt/lists/*
>  RUN apt-get update && apt-get install -y fig2ps inkscape xfig graphviz psutils \
>      texlive-publishers texlive-pstricks texlive-science texlive-fonts-extra \
> -    make nano vim git curl gnuplot-nox time poppler-utils librsvg2-bin && \
> +    make nano vim git curl gnuplot-nox time poppler-utils librsvg2-bin pandoc unzip zip texlive-lang-japanese && \
>      rm -rf /var/lib/apt/lists/*
>  COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
>  RUN fc-cache /usr/local/share/fonts/
> diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> index f03e39a9..6068b215 100644
> --- a/utilities/gitlab-ci.yml
> +++ b/utilities/gitlab-ci.yml
> @@ -31,3 +31,20 @@ generate_pdfs:
>            - perfbook.pdf
>            - perfbook-1c.pdf
>            - perfbook-eb.pdf
> +
> +generate_epub:
> +    stage: build
> +    allow_failure: true
> +
> +    before_script:
> +        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript graphviz librsvg gnuplot wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation pandoc poppler texlive-langjapanese unzip zip epubcheck
> +        - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
> +
> +    script:
> +        - source /etc/profile
> +        - make epub epub-endnotes

IIUC, the targets in this project tend to be the output filenames.

> +
> +    artifacts:
> +      paths:
> +          - perfbook.epub
> +          - perfbook-endnotes.epub


I tested it, and it ran the new generate_epub job for 40 minutes without 
finishing (last command at 1m46s). Since generate_pdfs takes about 2 
minutes to finish, I thought something was going wrong.

Thats the job:
https://gitlab.com/linux-kernel/perfbook/-/jobs/18239889160

I retried and the result was the same:
https://gitlab.com/linux-kernel/perfbook/-/jobs/18240502790

Please test if the job concludes before submitting a new version.


In terms of Gitlab-CI yaml, I would recommend against duplicating the 
generation recipe. When you add generate_epub, it requires to run all the 
setup again (i.e. configuration and pacman installation) in a new instance.

Instead, to avoid duplicated code and work, I recommend just changing the 
original script to include the new targets (-epub, etc), as well as the 
artifacts list.

Not sure if you actually need to have an allow_failure, but if that's the 
case, one simpler option would be:

    script:
        - source /etc/profile
        - make perfbook.pdf perfbook-1c.pdf perfbook-eb.pdf
+	- make perfbook.epub || touch perfbook.epub 
+	- make perfbook-endnotes.epub || touch perfbook-endnotes.epub 

and having a zero-size file in the artifacts means it failed.

Thanks!
Leo
