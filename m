Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520155;
	b=EgPyNblTO0KQQ2nzHizDx15Borf0Bou7gs5pWDtWmpmBQiHWAf4LK91nHOcL8xLT072P
	 JcLhDtfZx7H2vbOiV3fPC1g1k5+zodBMnHpWrWu7G35PwR1IIvkdZa+nOkFSc/kiwR4M+
	 EhsK9CRgrBV33j+cEtHUq/X9Rc+JEpM7aBYb9Mf0O7ld89Z+owv3H3h94IIqL+gS2jWr6
	 lnYm5YOTV7X6YH12s0nnn48r9E/xCy5omPn8J996Hxy/zzVnLVxGDZLc61kk/5d1aX1iC
	 d0uqaX4FACuroooBnssTBOR50Zt1iKTQlRgRZFsXWVrbDzycl7AgGlEYvMx4jxgSs3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CSy1NvXtkWgcj90/c1+cOYC6EVTMgoZYF9k8udQ5TI0=;
	b=SYSUOXpHABZN3Y8FFVZ+ZWhvLNndffdBLrT6Q5pVeh3HHNTzNoHDMpw/JpD48Rq2HT+O
	 sf+MTxCikJa2BXMVPCGxJTPTgDtvLcoa+CAI2fk/se8yl+6H6s8LvX5SvPmaSFs3HCt8X
	 TaEn3TMy6+znfyhdXoFpEZ1Jv9lORrP3/9n0Z92P1dI90oNiRQqkgLii6FKZQFce3Pgdy
	 pTRw2gRyh+fH1kiOuShJtkPktwqzFs3f+bSGLknI3MrkCKdSld9qy7rL01hBxW8icOR14
	 /IuvDtym7Lu/dcZqxehGyHU25rryK3n92Mr3xUDsOiA9dVYj+TexOWD67H9UH7rySgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wejGth1z;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79167606A31E
	for <perfbook@vger.kernel.org>; Tue, 24 Nov 2026 11:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79167606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wejGth1z
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so2041577b3a.2
        for <perfbook@vger.kernel.org>; Tue, 24 Nov 2026 03:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795520155; x=1796124955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSy1NvXtkWgcj90/c1+cOYC6EVTMgoZYF9k8udQ5TI0=;
        b=wejGth1z3iJioCV+SDPLAjTNTtcapF5Dsg8ix3ZdkTZ1EY711KNDO3HX1Pomgv1P2w
         vjYmq0BNGJjQJk3g6Zy1FteRESIrdmqUKFos4IiUuEQDh+TXHmquE4cMh7IW7tHeGdD6
         8DlRszV78Kj1Y9trNI0zXi7dO/84OwWyp2+/M+jbCrrl+zOqkRLuseMjxYNztlVDMB7f
         NFaRjOilafqE8BHUKXEAm18bXFyjgZv9c5LPs67JfT+5rt+rR462SYKU2CcadymjabNs
         wviT+QRGGtdsQYbumRgAqK5bTswZM1Vz+J0YEFCQQ9n+ElcuQYT8pEOdiLFo9i+iyk4w
         MoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795520155; x=1796124955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSy1NvXtkWgcj90/c1+cOYC6EVTMgoZYF9k8udQ5TI0=;
        b=ptT9EWFJfX7j5hVWD5txRwylQCZ+9TWnbmLGBBjr5o6ucekR0+UPOZe0u7Gq2LcDYX
         KQk0+6wdcr+B4xafhAPSC91QOB1ltIDfkYtyxB47balhKM553V8nRzXzuFqY6JNgKOFO
         xdVluU+J1AYUW8X3PUee4LGKuqne5EgCp0wVNe+W3V4JPkyYFqVZBfDlzoYh2FbqJzuS
         96q54MxwmnL03lr++cn3kbBUOLjpCCnou7mkB2MZBxIQpIcle3SUSuZxt74fwCSFHjSA
         OTpNZB7hxF+uxFfV0rXhct47WsbjKLr6utU11dm6uP4TL9QNN8oy1MnXS5951osPjgXy
         bs5w==
X-Forwarded-Encrypted: i=1; AL+hErHiH6AODk4+nmX369F8FKzpD1dEgfu0ZDTgSI2BeVlF56avIXugh0Z15a3rBee9KEHGj5JuZco0IQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Oy/1jbpn9lNMFLQL/c3e1aUB4OwVcnbDMst5JI71PpvBOYAtR
	/rAlmVv71RGua+WrQsWOkkoznnjl2k+eP/UKX1cnpI927iwNTKqEQhicjB+bAQ==
X-Gm-Gg: AZFdTZcL7i6srqd5YP4OqR5pWVUImAzqKPjsO/9M0ZvNNCOyjyD4yWwN0r6dhJXplIc
	QtuyrRFSRD9gO5D5Oy+/LxrXUlJ13dDn3kfc4nCu1ORdiBTnJBvHVi2fgcdxx3KKSeT12HyWqI9
	8XTYuDH8U9ei9dTNIiINr8x/3UVTY45nqgDx964XNn9tqsGM2zmUqyRtJT/S1gsIBE8CxqucGDd
	9qfMiUKw2DzQVLXrYhVjss+HtteR77TtpQ1Mgk5euUbkZXFwJGFUePqfTWtRfEQzl6sge311GkM
	P0qyxkUbpt69bnsfk5ZGVzkLHxOtehKhajUr2Ks4xbdBTfUCkmQSVbieM80A8wQAAnvzfgczvEO
	jKv/na/gX5bQR0lXiwW3ZR8Y0lAIKL+iEtkexGcl1FLeQOp6Z6kdLZHWro0c+pZxDAG5we7abfo
	UApMGFFQ6muheAFdQKOMGUKYy+kJYCD2x8EWDF4tTHgP7dzUUxVZqWIj3Ys4RZnJABsvp1yoeX7
	Qq1K/0GUac+XyH6Yb+kEggzzdbMFOULqSTQTX5h9aSFnkVXliBwqL4Ttzdkan4ov5KRceW7UPv5
	/W3ti5VjlqfUTCEpPg9yAqdfkmMliBH1h2erQQIaxAr1CP46Qx8AGVEub++qCSlbk3EfGxbb1w=
	=
X-Received: by 2002:a05:6a21:1b81:b0:3de:b120:bba4 with SMTP id adf61e73a8af0-4014bc4b224mr13365601637.50.1795520154779;
        Tue, 24 Nov 2026 03:35:54 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cfa0sm6942887b3a.48.2026.11.24.03.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:35:54 -0800 (PST)
Message-ID: <ac69ab31-24b8-4771-b87f-b439385abd51@gmail.com>
Date: Tue, 24 Nov 2026 20:35:47 +0900
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Post: <mailto:perfbook@vger.kernel.org>
List-Help: <mailto:perfbook+help@vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
List-Owner: <mailto:perfbook+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/7] utilities/runlwarp.sh: Add lwarp and Pandoc build
 driver
To: Ferenc Fejes <ferenc@fejes.dev>, perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
 Leonardo Bras <leobras.c@gmail.com>
References: <20261115210138.229034-1-ferenc@fejes.dev>
 <20261115210138.229034-4-ferenc@fejes.dev>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20261115210138.229034-4-ferenc@fejes.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I think I see what went wrong under Gitlab-CI.
See below.

On Sun, 15 Nov 2026 22:01:34 +0100, Ferenc Fejes wrote:
> Add utilities/runlwarp.sh to drive multi-pass lwarp HTML compilation,
> background SVG math rendering, and Pandoc EPUB3 packaging.  After
> running epub-fixhtml.pl and appending epub.css, the script verifies
> anchor, equation, footnote, Quick Quiz, and epigraph counts and runs
> epubcheck when available.
> 
> Signed-off-by: Ferenc Fejes <ferenc@fejes.dev>
> ---
>  utilities/runlwarp.sh | 286 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 286 insertions(+)
>  create mode 100644 utilities/runlwarp.sh
> 
> diff --git a/utilities/runlwarp.sh b/utilities/runlwarp.sh
> new file mode 100644
> index 00000000..7e0dbd65
> --- /dev/null
> +++ b/utilities/runlwarp.sh
[...]

> +
> +# Wait for backgrounded pdfcrop/pdftocairo jobs spawned by `lwarpmk limages`.
> +wait_limages () {
> +	while find "$base-images" -name '*.pdf' -o -size 0 2>/dev/null | grep -q .; do

It looks like "find" on Arch Linux needs explicit -print.
After adding it as follows:

	while find "$base-images" -name '*.pdf' -o -size 0 -print 2>/dev/null | grep -q .; do

, both "make epub" and "make epub-endnotes" completed under Arch Linux.

> +		sleep 0.1

Probably "sleep 1" or longer would suffice, I guess.

Hope this helps.

Thanks, Akira

> +	done
> +}
> +
[...]
