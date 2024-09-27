Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D752EEAA
	for <perfbook@vger.kernel.org>; Fri, 27 Sep 2024 23:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727479921; cv=none; b=gHM1WpeB5vNGuuZwVGwMDwqrjzJd2CGbiZqB2TOuxW28uxMQp0cwdRJAVB0Zcsqd3bj0LOL6ZzzWMgb4OgC5/5RcGR5NDHxblqwF93SVve+czEQqSwkZeW2PNxVw2NGHziTO2ksTd2wtjD1JpP2rMVe1EOyiVnsaQW9hnJZncxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727479921; c=relaxed/simple;
	bh=viJ4vcnxKdt52iXF5TeiQjLnQBsAYPT8giJ20dD75P8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Mxhbn7FE46GwS6Jaha5p5y6IEPOQnbKTSk7axT6YVMNHHtg3ZIfK1EfKYfeNHpJ0yYcg8r5IrFalHUXZH1VDzXmgYgI1IrN7VE2MhSvFL3npq0Oq58u/OW4YTwDjOdPILofIyRtteSVG/4PO0h9KexmNNthFziG+1NBp8Pn2xdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsiwMikf; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsiwMikf"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7d50e865b7aso2005533a12.0
        for <perfbook@vger.kernel.org>; Fri, 27 Sep 2024 16:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727479920; x=1728084720; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNoiuFipGvv+ShkCYQmOoZk2cgdPgcey1A7Po0Ji5go=;
        b=BsiwMikfi/pmw3mrUB+h9uhnA7j0s/81va9TdoBQ0/TScb3P97SefJ17UJ49LWzXov
         qqnHTvew/8NjVlRO61qXN9HwSlZD2dgm2JjG71BAe6lNv83gu6agXns4k8lzp8nOhfSM
         dcz4fwPY4rUoNz03nuTM7G3SwBroRQ0XJFq/gvoMSP8qrhbccevbw8LeWkd64E27U4oh
         d2CAw7f8Vb6I6LKN4iFaKVZ1kcRZJH5b6JhMmUJ0wYWBBrwYAiV+iVNQEZbLRS2Z0tU2
         /0/C5tAbnqRiz90+v9HPTQS5ZQe/oILDp+Jrc2TZhlRq0Yp5Lb6qdapexdQErTYZBkyc
         CZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727479920; x=1728084720;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DNoiuFipGvv+ShkCYQmOoZk2cgdPgcey1A7Po0Ji5go=;
        b=QZJSuz4Wm2fjTACSxyL+mFxp+MhW3mJV//0nPFOmSjampHKSjvyk3IuOKPZKLyrw0U
         UmY/JR3MznJoM3mz9LSoVu+OIJvuq0vuTexXszeCL720aIBhXcx59eIPkXzxYXZZ1Zkb
         0oE4JzzRgqaKlT/iwQ4Cbej4+EpnO6PpymlFqoGhU0MYGAG85DsmDe6cw4jiwvpUoZ1D
         7A/Jt8GuK3gtHjY2VVjYSgS4bykdALqX+O9UXpkJ+SYZTzJLEbZyx6tlhv56JovkvsGw
         Q7keeflFDfUgJmuCLIFJQF/x76Bshd6ol2Q86c2LvovwvXVQVyl7HfjU1wJ+NVs4Pl0l
         v0rQ==
X-Gm-Message-State: AOJu0Yzejz/x/LiwdkoD7vQ66Whuc8b1rGNu+0TgH02HGhDEw8d9Gr/M
	QZjsZHFVL4sWi735PNmwQB0OC8dj+aqFW3nC+4WI0uNjJwHIhemA
X-Google-Smtp-Source: AGHT+IEdlDU4E32VMEogAgiJYYOkWByrpLX5wsj0FsrtjaxsZcOnxZRe1lvTUmwWEmTy5iutvV9PBg==
X-Received: by 2002:a05:6a21:6481:b0:1d2:e9e8:5e78 with SMTP id adf61e73a8af0-1d4fa6c3974mr7905836637.23.1727479919722;
        Fri, 27 Sep 2024 16:31:59 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649a2cesm2135192b3a.43.2024.09.27.16.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 16:31:59 -0700 (PDT)
Message-ID: <f92aa1ae-7a8c-4b42-be76-591ea765d53d@gmail.com>
Date: Sat, 28 Sep 2024 08:31:55 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] CodeSamples/formal/rcutorture.sh: Don't bother
 with stable tags
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When run under a kernel repository which has a stable repository in
remote, data for stable tags such as v6.6.1, v6.6.2, v6.6.3, etc. are
collected as well as those for mainline releases.

Refactor the grep pattern so that only v2.6.m and v3.n, v4.n, and
later are listed in $tags.
Use the nice -V option of sort instead of hard-to-parse -k options.

Factor out starting point version to SINCE, which can be overridden
by setting it as an env or shell variable.

This should continue to work with v10.0 and beyond as long as
mainline sticks with current scheme of release numbering.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/rcutorture.sh | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/formal/rcutorture.sh b/CodeSamples/formal/rcutorture.sh
index 23686805..5e568e24 100644
--- a/CodeSamples/formal/rcutorture.sh
+++ b/CodeSamples/formal/rcutorture.sh
@@ -20,10 +20,18 @@
 #
 # Copyright (c) 2019 Paul E. McKenney, Facebook.
 
-tags="`git tag -l | grep '^v' | grep -v -e - | grep -v '\..*\..*\.' | grep -v '2.6.11' | sort -k1.2,1.2n -k1.4n`"
+# Override by saying, e.g.:
+#     "SINCE=v6 sh <path of this script>"
+: ${SINCE:=v2.6.12}
+
+tags="`git tag -l | grep -E -e '^v(2\.6|[3-9]|[1-9][0-9]+)\.[0-9]+$' | sort -V`"
 
 for t in $tags
 do
+	tagsince=`echo "$SINCE\n$t" | sort -V | head -n 1`
+	if [ $tagsince != $SINCE ] ; then
+		continue
+	fi
 	git reset --hard $t > /dev/null 2>&1
 	nontorture="`ls kernel/*rcu*.* kernel/rcu/* include/linux/*rcu* 2> /dev/null | grep -v torture | grep -v rcuperf | grep -v refperf | grep -v rcuscale | grep -v refscale | grep -v Makefile | grep -v Kconfig`"
 	ntn="`wc -l $nontorture 2> /dev/null | tail -1 | awk '{ print $1 }'`"

base-commit: 2eb3375d38e20694912f3f5fdbb744a7079c62e6
-- 
2.34.1

