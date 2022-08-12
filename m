Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbiHLSiW (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 12 Aug 2022 14:38:22 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C8CB3B29
        for <perfbook@vger.kernel.org>; Fri, 12 Aug 2022 11:38:21 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id s11so2324957edd.13
        for <perfbook@vger.kernel.org>; Fri, 12 Aug 2022 11:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=onwsvHOfKUwHz1US/ITTFzqwkDkMpVh3U+zFoBLwNaQ=;
        b=KLgxC6NXsd9D9Fp+ucxJWWgt8CRQF73ajXHuH5shkgqOHTsJZ/8p/zmIL/vO5tZRHI
         2SbdHeoPuQVC6AjPhizhafHvdRni+r07MnmfAX19cdwWHVrZSDhJBnrxjfrlhqcnBS+I
         WQHedR0IY+SDEBb+RoaZImbSFLBzgApeKLh2jzbfwe7bikutaQJEfw1Yffpp3rU7Ks3f
         BcxlQgLnWv0fwxVlSTIKNMWVZC4XOo0Uv7NyY/vhPILUE3ESot+ZT0MB7SEGK9MhhJU3
         FPCFlKKQr9UzvvDdGeGHi/bU8e1YEd9D9VsaDS6EahAi1y4MdsIGN7dN3EbpEyH1ALe9
         aTeg==
MIME-Version: 1.0
From: Elad Lahav <e2lahav@gmail.com>
Date: Fri, 12 Aug 2022 14:38:06 -0400
Message-ID: <CAJbg=FV_ngVf2dKkaTMD0QM1713ppDBj-yfQJTOuqmnUUyOncw@mail.gmail.com>
Subject: [PATCH-perfbook] count: The fast path is for the write side
Content-Type: multipart/mixed; boundary="00000000000007781305e60f96e5"
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

--00000000000007781305e60f96e5
Content-Type: text/plain; charset="UTF-8"

Sent as an attachment because I'm behind a corporate firewall and can
only use Gmail's ^$*&^@# web interface. If that's not acceptable I'll
find another method to send a Real Text Email, just like mother nature
intended it to be.

--Elad

--00000000000007781305e60f96e5
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-count-The-fast-path-is-for-the-write-side-not-the-re.patch"
Content-Disposition: attachment; 
	filename="0001-count-The-fast-path-is-for-the-write-side-not-the-re.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l6qt93ya0>
X-Attachment-Id: f_l6qt93ya0

RnJvbSAxNTNjZDQyNjFmZTU4ZWQ3ZjI2YmIwYjEyMzJlYWUyZGU0MzA3MGFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFbGFkIExhaGF2IDxlbGFoYXZAcW54LmNvbT4KRGF0ZTogRnJp
LCAxMiBBdWcgMjAyMiAxMzowNDowOCAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIGNvdW50OiBUaGUg
ZmFzdCBwYXRoIGlzIGZvciB0aGUgd3JpdGUgc2lkZSwgbm90IHRoZSByZWFkCiBzaWRlLgoKU2ln
bmVkLW9mZi1ieTogRWxhZCBMYWhhdiA8ZTJsYWhhdkBnbWFpbC5jb20+Ci0tLQogY291bnQvY291
bnQudGV4IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvY291bnQvY291bnQudGV4IGIvY291bnQvY291bnQudGV4CmluZGV4
IDdlNzRkNThmLi41MjM3ODllMiAxMDA2NDQKLS0tIGEvY291bnQvY291bnQudGV4CisrKyBiL2Nv
dW50L2NvdW50LnRleApAQCAtMjI2Miw3ICsyMjYyLDcgQEAgYmUgcnVuIGFsbCB0aGUgd2F5IHRv
IGVpdGhlciBvZiBpdHMgbGltaXRzLCBidXQgaXQgZG9lcyBzbyBhdCB0aGUKIGV4cGVuc2Ugb2Yg
YWRkaW5nIGF0b21pYyBvcGVyYXRpb25zIHRvIHRoZSBmYXN0cGF0aHMsIHdoaWNoIHNsb3cgZG93
bgogdGhlIGZhc3RwYXRocyBzaWduaWZpY2FudGx5IG9uIHNvbWUgc3lzdGVtcy4KIEFsdGhvdWdo
IHNvbWUgd29ya2xvYWRzIG1pZ2h0IHRvbGVyYXRlIHRoaXMgc2xvd2Rvd24sIGl0IGlzIHdvcnRo
d2hpbGUKLWxvb2tpbmcgZm9yIGFsZ29yaXRobXMgd2l0aCBiZXR0ZXIgcmVhZC1zaWRlIHBlcmZv
cm1hbmNlLgorbG9va2luZyBmb3IgYWxnb3JpdGhtcyB3aXRoIGJldHRlciB3cml0ZS1zaWRlIHBl
cmZvcm1hbmNlLgogT25lIHN1Y2ggYWxnb3JpdGhtIHVzZXMgYSBzaWduYWwgaGFuZGxlciB0byBz
dGVhbCBjb3VudHMgZnJvbSBvdGhlcgogdGhyZWFkcy4KIEJlY2F1c2Ugc2lnbmFsIGhhbmRsZXJz
IHJ1biBpbiB0aGUgY29udGV4dCBvZiB0aGUgc2lnbmFsZWQgdGhyZWFkLAotLSAKMi4yNS4xCgo=
--00000000000007781305e60f96e5--
