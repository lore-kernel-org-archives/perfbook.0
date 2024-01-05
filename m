Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1E5225AC
	for <perfbook@vger.kernel.org>; Fri,  5 Jan 2024 09:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIh7S7AT"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d4d4542526so10404485ad.0
        for <perfbook@vger.kernel.org>; Fri, 05 Jan 2024 01:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704447890; x=1705052690; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPQc6Un/DvOSXX4TQ3TkdQnQ/vThbcrtRYW+lMKWPbs=;
        b=mIh7S7AT4w9Gob9rt0kYnNKO4HB7E8DHU/nXoob353iMP0Qvn7wCOUrax3ivzYlWc7
         kkCn9KMft8zuUDwB0d6KK6xQp+bcFgQndO/sJ2tovbsT1sMSYUuFJnvilDMWTR7y/HGJ
         l/fpKmAUYYgsJvUzC/qMko4L2xZiuGK2sLIoca2XVEzdvowRdXN2NFEym5uxw8hZdbbg
         bG7ACirdiXK7QQE8t9W3H66FwcqMuq2VWMbzgy0gXzvXIOT6ndaDAEfX7K1ncgg5/mFR
         WedPYLVQfkcP8kuL5x6NEDDeJFyF6F9cR9FiMCLJ26I3C7+mOHG87XQ6ESBJLUvU9AYp
         qs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704447890; x=1705052690;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cPQc6Un/DvOSXX4TQ3TkdQnQ/vThbcrtRYW+lMKWPbs=;
        b=N3oK6fPgd39A4Z29Zv8Bw0t9PZEo5JRyU3mUzFUMV/Kk3fh/VHJWBHA5BOE6FjVu1i
         1uos4uenjwRxKNU7gLw6JNAs0r3fbRH2qIgg9sROdRFPD16qC08HyXTlR3z/Ntm+K7OS
         ChDvt3YUnV2dzu/aWmPPwW8gPSwZurRDjpIVWIMD+ixV8U5vkW2xyoG9WbWDIwPLdT9O
         Nz5c65dPjKz1McWemXaoWs2S51gAGtAt0ZVyNUTKIVgJfzersQt5hDGAJGqGZ9Jv7vHy
         VJb1ZXKRCbaYh1u7oHaZggFkvVa7b5xYxnPqxd2hjDk6em3DI5vVVdo0zw2WIoKE3Z6f
         Ud5w==
X-Gm-Message-State: AOJu0Yw27Oe9Ij2WlDjbNicj4LVe2A8cRiuhfeHK3GZE3AK8SZeU2azK
	K/p6ILlJzofitezvAGmejwo=
X-Google-Smtp-Source: AGHT+IE+E4wGE/lAzCWMYDEec/n2HtQS1cOkydh978efGnRtnnAwQL8ASebsd+PuXjYHV6Xepm77Tg==
X-Received: by 2002:a17:902:6a82:b0:1d4:bc19:d7cc with SMTP id n2-20020a1709026a8200b001d4bc19d7ccmr2024099plk.116.1704447890348;
        Fri, 05 Jan 2024 01:44:50 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902e80d00b001d072365b87sm1001128plg.106.2024.01.05.01.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 01:44:49 -0800 (PST)
Message-ID: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
Date: Fri, 5 Jan 2024 18:44:47 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Leonardo Bras <leobras.c@gmail.com>,
 Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/8] Use rsvg-convert for SVG --> PDF conversion
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

[Cc 0/8 and 8/8 to Leo, Patch 8/8 touches gitlab-ci.yml]

Frequent crashes of Inkscape I encountered in 2023, which was mitigated
in commit f307e19f2be0 ("Prevent inkscape from interacting with desktop
manager"), made me look into alternative SVG --> PDF converters.

It turns out that recent versions of rsvg-convert work reasonably well
for perfbook.  By "recent versions", I mean 2.52.5 and 2.57.x.
rsvg-convert is a light-weight CLI command and is much faster than inkscape.

Sequential SVG --> PDF conversion time I get from
"make cleanfigs-svg; env time make figs":

                elapsed
Inkscape:        21.45s
rsvg-convert:     6.05s

So patches 1/8--4/8 add rules in Makefile for using rsvg-convert if it
is recent enough.

One caveat: There is a SVG cartoon drawn by an ancient version of Inkscape,
for which very recent versions of rsvg-convert produce distorted background
of outlined text.

Patch 5/8 retouches the cartoon and put a SVG compatible with librsvg as
cartoons/r-2023-Memory-barriers.svg.

Patches 6/8 and 7/8 adjust FAQ-BUILD and Dockerfiles accordingly.

Patch 8/8 updates gitlab-ci.yml.  It needs an explicit ACK or Tested-by:
from Leo before applying.

Finally, this series wouldn't affect those of you who don't have
rsvg-convert.


        Thanks, Akira
--
Akira Yokosawa (8):
  Makefile: Add rules to use rsvg-convert for SVG --> PDF conversion
  Makefile: Don't use rsvg-convert < 2.57
  Makefile: Allow rsvg-convert 2.52
  Makefile: Use rsvg-convert anyway if no inkscape is found
  cartoons: Retouch r-2014-Memory-barrier.svg
  FAQ-BUILD: List package for rsvg-convert in package lists
  docker: Add packages for rsvg-convert
  gitlab-ci.yml: Install librsvg instead of inkscape

 FAQ-BUILD.txt                      |   23 +-
 Makefile                           |   48 +-
 cartoons/r-2023-Memory-barrier.svg | 1130 ++++++++++++++++++++++++++++
 cpu/overview.tex                   |    2 +-
 docker/Dockerfile                  |    4 +-
 docker/Dockerfile.fedora           |    7 +-
 utilities/gitlab-ci.yml            |    2 +-
 7 files changed, 1198 insertions(+), 18 deletions(-)
 create mode 100644 cartoons/r-2023-Memory-barrier.svg


base-commit: 1ea46c6d43475fbdf97404dec28a58036d505bc3
-- 
2.34.1


