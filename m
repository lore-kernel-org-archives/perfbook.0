Return-Path: <SRS0=fWmf=6A=redhat.com=leobras@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675479402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fjbOuA0YIcefv58LntKe2wmGHnhnztVHqL+w2rUrjTM=;
	b=JdYV3hj1VDUViHH9ZlxupodQrUF8c5pFuI8+OlIcq9ofWIiZSA42aYvK5u+hFi5uYJMTKy
	B0M+3buAkbZSOTU5yMzFCKyl3xED8LH8a1GG2zj70dhUxJL3o/lb4DFXgB8XvJurACjxR4
	aFhHFg36fbnLT+OtzEt/YhCqj4qTP+c=
From: Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v1] Codesamples/depends.mk : Replace non-portable uname '-p' with '-m'
Date: Fri,  3 Feb 2023 23:55:37 -0300
Message-Id: <20230204025536.64981-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: paulmck@kernel.org
Cc: Leonardo Bras <leobras@redhat.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

`uname -p` returns 'unknown' for current coreutils.

On GNU coreutils 9.1, the uname --help text says:

uname --help
Usage: uname [OPTION]...
[...]
  -v, --kernel-version     print the kernel version
  -m, --machine            print the machine hardware name
  -p, --processor          print the processor type (non-portable)
  -i, --hardware-platform  print the hardware platform (non-portable)
[...]

Looking deeper, I noticed that '-p' is supposed to be printing the
processor type when available, and not necessarily the architecture.

For printing the architecture, it's recommended to use uname -m, instead.
Even so, it seems like some distros make '-p' to return the same as '-m'
for compatibility purposes.

Anyway, change '-p' to '-m' on depends.mk to avoid getting arch=unknown.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 CodeSamples/depends.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/depends.mk b/CodeSamples/depends.mk
index 30810339..2086fe00 100644
--- a/CodeSamples/depends.mk
+++ b/CodeSamples/depends.mk
@@ -1,5 +1,5 @@
 ifeq ($(strip $(arch)),)
-arch := $(shell uname -p)
+arch := $(shell uname -m)
 endif
 
 ifeq ($(strip $(os)),)
-- 
2.39.1

