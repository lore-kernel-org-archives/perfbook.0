Return-Path: <SRS0=Byfs=UW=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=dqlhLtD0qXy69st1MTi69bLhkKOatbfnatR0yblPtZs=;
        b=i7zxB8VtYkw8+vOjk4zScQy7jmD+T1M97MDUgznj87TTmGeGvbly5V4QL0Z0s4VecS
         J3+YBpbJWkK4h6S8wJosONK7Ko8DVbsZKiXMh07JnKMGbkSAMq0YubyijymJ5y23bC0N
         vikAaF1hAhHczVrksc41UKqexbR4xX/2ML4/dz5H4PV4OhC5L8v0Zg6CN2qws+Lc7XM3
         gyZeXSxShsvz+UewkEEPo/USs2mNdBadYwexduMgYq5LwdVPSTTzz356uKb52uwaANqF
         t1YxvyIGpG6kcTiUggVMKOHmwK+mzZ9S04wUv+YvQ17bW96fCh9babDeAeKQRC4cSbM/
         t/zA==
Date: Tue, 12 Apr 2022 02:55:59 +0000
From: Hao Lee <haolee.swjtu@gmail.com>
Subject: A question about MESI in appendix C.2 Transition (h)
Message-ID: <20220412025559.GA3597@haolee.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hello,

I have a question about the MESI protocol in appendix C.2.

As said in C.2.1, the cache line in the shared state is up-to-date. And,
C.2.2 says implicitly a writeback message is used to writeback a dirty
cache line.

Then in C.2.3 Transition (h) Shared->Exculsive, it says:

	Alternatively, all other CPUs eject this cache line from their
	caches via "writeback" messages (presumably to make room for
	other cache lines), so that this CPU is the last CPU caching it.

As some CPUs share this cache line, it must be clean. I think other CPUs
only need to discard the corresponding cache line in their cache without
any additional operation when receiving a invalidate message. Why do
they need to send a "writeback" message?

Thanks,
Hao Lee
