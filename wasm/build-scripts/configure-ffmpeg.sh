#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
  --enable-zlib           # enable zlib
  --disable-demuxers
  --enable-demuxer=aiff
  --enable-demuxer=wav
  --disable-muxers
  --enable-muxer=aiff
  --enable-muxer=wav
  --disable-decoders
  --enable-decoder=pcm_s16le
  --enable-decoder=pcm_s16be
  --enable-decoder=pcm_s24be
  --enable-decoder=pcm_s32be
  --disable-encoders
  --enable-encoder=pcm_s16le
  --disable-protocols
  --enable-protocol=file
  --disable-filters
  --enable-filter=anull
  --enable-filter=aformat
  --enable-filter=aresample
  --disable-bsfs
  --disable-parsers
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"
emconfigure ./configure "${FLAGS[@]}"
