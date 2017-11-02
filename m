Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=JD9m7L03g8x1+0jvKVsTYIXzx1CpmDpuirDnjYNixPA=;
 b=WahdlpJU+e/qKHaD9sQ7ZMtPXPS5ecA1ghuAez9LVxQhzY+v1WJ1IY0L8wo/DPLZpc
 x6uhgbsx3JvRZjoQLKzDzGmyD3VcWRqGO5EBFBBdMSJRLY3EEz1TgukqkVGjNUeydtu9
 wlsKN+W+Cynl+hdfyJy4IudnGMUBPY+EHusoXdLXl0+4RMpwylvsAeOGETsR+WsnA5wt
 C3Ae+YLFsFUEEOllLwI7vH8jrCrIBWEQOgpoc7YKR+qLi0M+sCKWDNeqku+PMfqey9F/
 aIGeI/aOrm85nQwdKRH4GVMmQx7LOPsTCMYvVHTkiJE37lX94ioJVOtfpgusx5RdVSaF
 /8Jw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Incomplete sentence in commit 405f3f465f7f
Message-ID: <765342ad-03aa-180f-308f-010a6d503b5d@gmail.com>
Date: Thu, 2 Nov 2017 22:32:30 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

In commit 405f3f465f7f ("debugging,formal: Update for increased Linux kernel usage"),
there is an incomplete hunk of formal/formal.tex

@@ -135,6 +147,7 @@ The larger overarching software construct is of course validated by testing.
        artifact from the viewpoint of formal verification, it is tiny
        compared to a great number of projects, including LLVM,
        \GCC, the Linux kernel, Hadoop, MongoDB, and a great many others.
+       In addition, 

        Although formal verification is finally starting to show some
        promise, including more-recent L4 verifications involving greater

What was your intention here?

    Thanks, Akira

