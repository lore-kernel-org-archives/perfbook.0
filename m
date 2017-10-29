Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:49790 "EHLO
 mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751646AbdJ2DYF (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 28
 Oct 2017 23:24:05 -0400
Received: by mail-pg0-f65.google.com with SMTP id g6so8358348pgn.6 for
 <perfbook@vger.kernel.org>; Sat, 28 Oct 2017 20:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=76yjysQuMqmPn5Gkvp7F+exKCLlqHCDU25NfY7mNTeo=;
 b=FY3hTKVR4JZ/bF5p7twwXpyhybhQ48fD2Z9A8GZB66qQsuIjB9veX7loKLYccIO2s/
 VdC5/JvX4bhiW6u2hKAcmQH23oGJcLxPUAR0IdoTdezmaYge5UYcq4g2c/rLRMEoIBQC
 2mN+THgJC4O/kgA7UZ9FkYJtNGwrJYdPrZ+zrSnryo2oeRkSKwTntbi09/03HBVGuv61
 1yQgWeF0R5JrxR9RPEMeJ1stsqmD1o84/hvqYuQhctXbEXjdiI/9ykDV0IV6AGjG90Uv
 PYMmXXvZPM2EisGF6d9qlg3JVptOUqVkgfdgFTU+ML/wbpb+3jT+jEjE0pnCtxtCo7Zu
 Hjtw==
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: algorithm that change a data structure without inflicting expensive
 cache misses
Message-ID: <dbe0006d-dc21-e397-c207-f9c1a37867b0@gmail.com>
Date: Sun, 29 Oct 2017 11:24:55 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi,

This question is raised Quick Quiz 9.23 and I think it is impossible because
any changes on a data structure will inevitably inflict cache miss (on other
CPUs). The only way we can help is to make the reader *ignore* the cache miss,
or do the invalidation proactively.

I cannot think of any existing algorithm. Can anyone provide any references
(if that really exist)?

Thanks,
Yubin
