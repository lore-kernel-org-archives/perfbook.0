Return-Path: <SRS0=vvz1=BZ=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685978967; x=1688570967;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+64RQwaVWLNWHrHyPzbTnXw/GJNT8OwgotyJvE48yQ=;
        b=HX/TQkIhdZnbGemVWMRSlmo5a2Ie6pDH+Xx3tO6X8urrLAJD7K+dgymgFsYlSvTJ8Z
         0yy1E5jl/8NtLvMYQu1PdcbD66a4pDOmnJE3jFl4hcEcL1UdPJEob/CYSO+cuhcdjMOt
         DB842vsTp5bN7h/TCHeEkUlwWt0SpRt2atlnycNInmD/x8B6qbU3NDBL5sdh684xBwHr
         7BbUOOzyig58s/ygtrZR0O9RPOLV53zvyzvi3r1qs7MOyMXVZ6yuJa5Wk3DRGpUlsU6m
         PUWy4tpCZq4YYqi0Yt0mYUHbNI32iA31P1ZKhBGkpcMwj9B4zJyqpAfQogkRvqHs6iCQ
         +A0A==
From: Alan Huang <mmpgouride@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Question about commit 94f01e467566("together/applyrcu: Note
 possibility of lost counts")
Message-Id: <68A3E1AD-093D-4EA7-930D-0BED8BF42A3F@gmail.com>
Date: Mon, 5 Jun 2023 23:29:22 +0800
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I noticed this commit 94f01e467566("together/applyrcu: Note possibility =
of lost counts=E2=80=9D) said that:

	count_unregister_thread()  can result in the outgoing thread's =
counts being lost.=20
        This can happen when read_count() is invoked between lines 66 =
and 68.

However, line 66 NULLs the local data, and it has not been published, I =
don=E2=80=99t think=20
count_unregister_thread()  can result in the outgoing thread's counts =
being lost.

Or, am I missing something?

Thanks,
Alan



