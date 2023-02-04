Return-Path: <SRS0=PvuL=6A=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hm1sy16GUmlzcSD+J+1m5ZU4Ct3HYlPIm5629WcvZdM=;
        b=pJddQ6OtGQbljCT9XJL4Db0UOONZiRy6cUpK7x3U0N4HVbGOE3kHr/TpbZG4+BVDDj
         9DL76nu2ow8fUx8q1TpCecI/EUJO2iAIWCEIUAF0k0uceiyHfklPghJMky4ZqC8ujh7Q
         El02XVjjFpOkxdYiaObKDhJGLl60ei0XOcRegO8hkDzJglnPQK42SJgjWcQ5hc9tmRt6
         hVcOLWHQ9dLAR5HcWnsCJ+h0IT84cY6Pla5romNV9Ow5Wb1j+P2mmDOP9aXK4zc5fgAE
         W5vIJYep1AKjEkjLSJS5Xqkl6jAaZZ88b5AYCycaUesGOpghbcWKWoIP7O7GOGl/fjiE
         76fQ==
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH v1] Codesamples/depends.mk : Replace non-portable uname '-p' with '-m'
Date: Sat,  4 Feb 2023 00:01:01 -0300
Message-Id: <20230204030100.65344-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org
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

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
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

