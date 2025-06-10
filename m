Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348AD21D59F
	for <perfbook@vger.kernel.org>; Tue, 10 Jun 2025 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551670; cv=none; b=gO2jP9t1Ue9+dQapyYoEFKA72p1Q5fhhCbkPbc73/6QY67ta+vTXaqhWuwFtpqvMTOXvVSgXadi1k1jdJ6nT0Hp4l/1Sx0UJwvLkGbx3Ty6PbI4pBnXQbeqJeQNT9FQxn95uofjYxScMyur/hzbr5b+sukwGgjlN1oxtZxJW1rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551670; c=relaxed/simple;
	bh=8dgAcYToa6bavLNEYAX0LVzWDbh+FkE3EuyScvIwNdU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ryqoR3BImEVeMSbut+6ABG1D2il55VUhJ2vuKsXjHevBmTaubpHwAzwbt8plDDbv/JDyEqFJupdL4b4I8NH+3XgygTKXqkYtRWiw0cHsY8AIA1kD6EQ26nIMjd9NCkABm36hBtY6Sn5dFvqYC8htdGF05RAgkyc2KF622SIgP/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/fLjEZn; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/fLjEZn"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742af84818cso3665939b3a.1
        for <perfbook@vger.kernel.org>; Tue, 10 Jun 2025 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749551668; x=1750156468; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juvOXJAQodWjRy1B2zVBQTPQf4YRSbIfUw+1yWcxVhE=;
        b=B/fLjEZn6RIl9tXne3TpshVBbps9q+yhxH35GW0yakNgM4AXcuGWxmhkOMcOQ8gALZ
         MMbyAfvcgejyBY5DYKGpeZxPxSe1b2+hi0X6ihO3HQFyZQXVReOmsM0WNJ/2bYAWfY2J
         v0GbqDncDUczYNO8mj8+tz821jL2d79S1MfzA+1pzWPrhtuGSN+kHlRyeiaptLfeU8O6
         ++bCdjc/ErhD81KvWAsmfGX7/LMjpv2HhbRJqi1X7AQIz4PZg2kM8dTywLSi6tUhxo+v
         Vn7Kbu5Vxc4Oj7JiNM8KzOD9uL1YMPqj3RG3RXtIVWvBYNKiK1EEMmPeyqwkbvUcG9Yl
         LwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551668; x=1750156468;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=juvOXJAQodWjRy1B2zVBQTPQf4YRSbIfUw+1yWcxVhE=;
        b=wipN5iE0TauMDhyUZ3Mvon3MpSzqqe8obG7E/lw439ua3AApBoHR8+gErYeqg22oaC
         8fdPGGKZ1GBOheWt0qeNtfwbMBCQ1u9P3uoDjyFtqPSB2TmH+vZSs/eEA7eO/2FFm8G1
         SZRyUBsLdIxg0ranBKbgWoowV8CCFeGhKRldYeZ0LC4gd8PPl7B960oaQYyQ4GRmtlXn
         uH5891w6kLJGSY+PpDogDDtllrVNdupyaVjW8X0P77V4HqN+TsvhIysmBbuVUr4ahtOH
         KP8SEKOHfN1/ksxXNpxZGws9EDDz9EcJa2E9RvMZxIJr1fH4wfWncsuSlu+A8i9Ir/JN
         8nhA==
X-Gm-Message-State: AOJu0YyldvXY8+kk2kgEzAcHZfDWuTUQkj9m59i3w/INZGcBlfgwj6dK
	OZi8E48fanPzv1CGrJTwoicmt/JSczocM7lxaloYXiHrnok3kWJ08Ax5
X-Gm-Gg: ASbGnctHon6uYnpv5ifbvSWLWvlgqpAxO5BnNIh1mg+jEZNDS4FXRrbkYfjlAqGjQNN
	12EihxQEwvxDJv0VN09LIjbrZAv+jxBmiPY3RAfe65MsdV1/3dLBGqo0d8g+lfy2Y4AHtVMJOR0
	rHApWQrpmT/+EvEo0JMeLJePauQe3ArKgO6y2YpaNmAzIeYmIgAFXrZkr7n2wtG45BVxmnUqHD9
	u0K2T3oIXsnwZWDBAU6/diEinvCKRr4ROV1BvZwSgx1eAd29Pxqleq8Kehpnax4Bl0nnc413LDe
	lWFGsqd+/TV8ZVW9dbx3WsK8LB2AuX++z6N/fwrIn+AOZZrs5Z1lcQ3vWPzdSboQIvvE/I8I8yg
	BldYAabMIi2YehiZMETvBvVkdcdOInbPYzNqYAmZyH5A=
X-Google-Smtp-Source: AGHT+IEeYZIWAsNRZL2YzaBgbQpRTuymn305rEsbh4XJWedVwwVl63ccUG3lwLyWIz2I+s2RkwvQpQ==
X-Received: by 2002:a05:6a21:6009:b0:21c:fa68:b47c with SMTP id adf61e73a8af0-21ee25b3bb4mr26463592637.18.1749551668361;
        Tue, 10 Jun 2025 03:34:28 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0ea282sm7127002b3a.151.2025.06.10.03.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:34:28 -0700 (PDT)
Message-ID: <2a03c9df-bdef-4895-9459-477e9451d3b2@gmail.com>
Date: Tue, 10 Jun 2025 19:34:25 +0900
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
Subject: [PATCH -perfbook 0/5] Misc updates and cleanups
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

This patch set is a collection of updates/cleanups here and there.

Patch 1/5 is a routine update of rcu-test.dat.
Patch 2/5 contains cosmetic changes in formal/dyntickrcu regarding
non-breakable spaces.
Patch 3/5 works around missing "awk" command observed in recent fedora-based
container images.
Patch 4/5 makes SVG --> PDF conversions more resilient to inkscape crashes
observed with an old (and possibly a future) release of inkscape.
Patch 5/5 tweaks shrink ratio of tall code snippets for ebook-size builds.

        Thanks, Akira
--
Akira Yokosawa (5):
  CodeSamples/formal: Update rcu-test.dat for v6.15
  formal/dyntickrcu: Add non-breakable spaces around \co{i} and \co{j}
  docker/Dockerfile.fedora: Add gawk in package list
  Makefile: Fall back to rsvg-convert if inkscape crashes
  toolsoftrade, count: Adjust shrink ratio of tall code snippets for -eb
    builds

 CodeSamples/formal/data/rcu-test.dat |  3 ++-
 Makefile                             | 24 ++++++++++++++----------
 count/count.tex                      |  2 +-
 docker/Dockerfile.fedora             |  2 +-
 formal/dyntickrcu.tex                | 12 ++++++------
 toolsoftrade/toolsoftrade.tex        |  2 +-
 6 files changed, 25 insertions(+), 20 deletions(-)


base-commit: f25caca80f576d06c14c23aaca673528163ca0b9
-- 
2.43.0

