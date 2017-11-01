Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=ZATAT+PvxfMmzt3/T6EGFP+jDolPsFLtIuL3QVfqs7I=;
 b=jFdlGObJMa00Evc4BQoZpoyWTXICj/rA0PpF5vVODUjVYHFROGBXuDMdpJxc5h9fZ3
 xJ7OYpnr0Ssx5ea2WLdQPorw2v2pIzANWdbrZrr+QJXRCm8xM9S6PB/nDCmKxhsXSHA+
 1N8V7uLrjXenHj3zRVUyFHSjN8WmIpmfknDWp3FA1J0oDnTL47zerCjPE+/ckmFQ8+7R
 sHtO9VyAfyx/KNqeR8uC0PV+dWsI/dJCRHYDLyz0S0335Sm0BFCxszfgT6xqD3jSqUQs
 fWRh2k0/LiuBhslG98AHeO3ZzgQ1vAqNMcSbmFm8N2hAKRe38j6zBai09TNR++e++581
 q4zg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: ARMv8 != arm64
Message-ID: <2ce74586-5ac7-db14-f4e0-2aad297d8481@gmail.com>
Date: Thu, 2 Nov 2017 07:34:28 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

In Section 15.4.3, you are treating ARMv8 as 64-bit CPU.
However, ARMv8 has 32-bit modes A32 and T32.
Instructions for load-acquire/store-release are also available in A32
and T32 modes of ARMv8.

The opening paragraph of Section 15.4.3 needs some rework, I guess.

      Thanks, Akira

